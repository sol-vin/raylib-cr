macro link_flag
    {% if flag?(:linux) && flag?(:x86_64) %}
        @[Link(ldflags: "-L#{__DIR__}/../../native/linux -lraylib -lm -lpthread -ldl -lrt -lX11")]
    {% elsif flag?(:darwin) && flag?(:x86_64) %}
        @[Link(ldflags: "-L#{__DIR__}/../../native/darwin -lraylib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreFoundation -framework CoreVideo")]
    {% end %}
end
