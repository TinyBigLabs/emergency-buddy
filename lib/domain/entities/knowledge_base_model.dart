class KnowledgeBase {
  final List<KnowledgeBaseElement> knowledgeBase;

  KnowledgeBase({
    required this.knowledgeBase,
  });

  // --- PARSER METHOD ---
  // This factory constructor parses the top-level JSON object.
  factory KnowledgeBase.fromJson(Map<String, dynamic> json) {
    // Access the list associated with the 'knowledge_base' key.
    var list = json['knowledge_base'] as List;
    // Map over the list, converting each JSON object into a KnowledgeBaseElement.
    List<KnowledgeBaseElement> elementsList =
        list.map((i) => KnowledgeBaseElement.fromJson(i)).toList();

    return KnowledgeBase(knowledgeBase: elementsList);
  }
}

class KnowledgeBaseElement {
  final String id;
  final String name;
  final String type;
  final List<String> keywords;
  final Details details;

  KnowledgeBaseElement({
    required this.id,
    required this.name,
    required this.type,
    required this.keywords,
    required this.details,
  });

  // --- PARSER METHOD ---
  // This factory constructor parses each element in the knowledge base list.
  factory KnowledgeBaseElement.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseElement(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      // Ensure keywords are parsed as a List of Strings.
      keywords: List<String>.from(json['keywords']),
      // Delegate the parsing of the 'details' object to the Details class.
      details: Details.fromJson(json['details']),
    );
  }

  @override
  String toString() {
    return "Knowledge Base Element {id: $id, name: $name, type: $type, keywords: $keywords, details: ${details.toString()}";
  }
}

class Details {
  final String address;
  final String purpose;
  final String capacity;
  final String frequency;
  final String information;
  final String criticalSigns;
  final String instructions;
  final String symptoms;
  final String treatment;

  Details({
    required this.address,
    required this.purpose,
    required this.capacity,
    required this.frequency,
    required this.information,
    required this.criticalSigns,
    required this.instructions,
    required this.symptoms,
    required this.treatment,
  });

  // --- PARSER METHOD ---
  // This factory handles the trickiest part: parsing the 'details' object
  // where most fields will be missing for any given entity.
  factory Details.fromJson(Map<String, dynamic> json) {
    // Use the null-coalescing operator '??' to provide an empty string
    // as a default value if a key does not exist in the JSON.
    return Details(
      address: json['address'] ?? '',
      purpose: json['purpose'] ?? '',
      capacity: json['capacity'] ?? '',
      frequency: json['frequency'] ?? '',
      information: json['information'] ?? '',
      criticalSigns: json['critical_signs'] ?? '',
      instructions: json['instructions'] ?? '',
      symptoms: json['symptoms'] ?? '',
      treatment: json['treatment'] ?? '',
    );
  }
  @override
  String toString() {
    return "Details {address: $address, purpose: $purpose, capacity: $capacity, frequency: $frequency, information: $information, criticalSigns: $criticalSigns, instructions: $instructions, symptoms: $symptoms, treatment: $treatment";
  }
}
