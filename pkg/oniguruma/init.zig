const c = @import("c.zig");
const Encoding = @import("encoding.zig").Encoding;
const errors = @import("errors.zig");

/// Call once per process to initialize Oniguruma. This should be given
/// the encodings that the program will use.
pub fn init(encs: []const *Encoding) !void {
    try errors.convertError(c.onig_initialize(
        @constCast(@ptrCast(@alignCast(encs.ptr))),
        @intCast(encs.len),
    ));
}
