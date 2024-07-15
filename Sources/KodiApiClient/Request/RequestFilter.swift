
public struct RequestFilter: Codable {
    public var `operator`: String;
    public var field: String;
    public var value: String;

    public init(
        `operator`: String,
        field: String,
        value: String
    ) {
        self.`operator` = `operator`;
        self.field = field;
        self.value = value;
    }
}