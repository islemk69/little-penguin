savedcmd_device.mod.o := gcc -Wp,-MMD,./.device.mod.o.d -nostdinc -I/root/linux/arch/x86/include -I/root/linux/arch/x86/include/generated -I/root/linux/include -I/root/linux/include -I/root/linux/arch/x86/include/uapi -I/root/linux/arch/x86/include/generated/uapi -I/root/linux/include/uapi -I/root/linux/include/generated/uapi -include /root/linux/include/linux/compiler-version.h -include /root/linux/include/linux/kconfig.h -include /root/linux/include/linux/compiler_types.h -D__KERNEL__ -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a -fcf-protection=branch -fno-jump-tables -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=x86-64 -mtune=generic -mno-red-zone -mcmodel=kernel -mstack-protector-guard-reg=gs -mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern -mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-return=thunk-extern -fno-jump-tables -fpatchable-function-entry=16,16 -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=zero -fzero-init-padding-bits=all -fno-stack-clash-protection -fmin-function-alignment=16 -fstrict-flex-arrays=3 -fms-extensions -fno-strict-overflow -fno-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla-larger-than=1 -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wno-array-bounds -Wno-stringop-overflow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -DGCC_PLUGINS  -DMODULE  -DKBUILD_BASENAME='"device.mod"' -DKBUILD_MODNAME='"device"' -D__KBUILD_MODNAME=device -c -o device.mod.o device.mod.c   ; /root/linux/tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --orc --retpoline --rethunk --static-call --uaccess --prefix=16  --link  --module device.mod.o

source_device.mod.o := device.mod.c

deps_device.mod.o := \
    $(wildcard include/config/MODULE_UNLOAD) \
  /root/linux/include/linux/compiler-version.h \
    $(wildcard include/config/CC_VERSION_TEXT) \
  /root/linux/include/generated/gcc-plugins.h \
  /root/linux/include/linux/kconfig.h \
    $(wildcard include/config/CPU_BIG_ENDIAN) \
    $(wildcard include/config/BOOGER) \
    $(wildcard include/config/FOO) \
  /root/linux/include/linux/compiler_types.h \
    $(wildcard include/config/DEBUG_INFO_BTF) \
    $(wildcard include/config/PAHOLE_HAS_BTF_TAG) \
    $(wildcard include/config/FUNCTION_ALIGNMENT) \
    $(wildcard include/config/CC_HAS_SANE_FUNCTION_ALIGNMENT) \
    $(wildcard include/config/X86_64) \
    $(wildcard include/config/ARM64) \
    $(wildcard include/config/LD_DEAD_CODE_DATA_ELIMINATION) \
    $(wildcard include/config/LTO_CLANG) \
    $(wildcard include/config/HAVE_ARCH_COMPILER_H) \
    $(wildcard include/config/CC_HAS_ASSUME) \
    $(wildcard include/config/CC_HAS_COUNTED_BY) \
    $(wildcard include/config/CC_HAS_MULTIDIMENSIONAL_NONSTRING) \
    $(wildcard include/config/UBSAN_INTEGER_WRAP) \
    $(wildcard include/config/CFI) \
    $(wildcard include/config/ARCH_USES_CFI_GENERIC_LLVM_PASS) \
    $(wildcard include/config/CC_HAS_ASM_INLINE) \
  /root/linux/include/linux/compiler_attributes.h \
  /root/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/ARCH_USE_BUILTIN_BSWAP) \
    $(wildcard include/config/SHADOW_CALL_STACK) \
    $(wildcard include/config/KCOV) \
    $(wildcard include/config/CC_HAS_TYPEOF_UNQUAL) \
  /root/linux/include/linux/module.h \
    $(wildcard include/config/MODULES) \
    $(wildcard include/config/SYSFS) \
    $(wildcard include/config/MODULES_TREE_LOOKUP) \
    $(wildcard include/config/LIVEPATCH) \
    $(wildcard include/config/STACKTRACE_BUILD_ID) \
    $(wildcard include/config/ARCH_USES_CFI_TRAPS) \
    $(wildcard include/config/MODULE_SIG) \
    $(wildcard include/config/GENERIC_BUG) \
    $(wildcard include/config/KALLSYMS) \
    $(wildcard include/config/SMP) \
    $(wildcard include/config/TRACEPOINTS) \
    $(wildcard include/config/TREE_SRCU) \
    $(wildcard include/config/BPF_EVENTS) \
    $(wildcard include/config/DEBUG_INFO_BTF_MODULES) \
    $(wildcard include/config/JUMP_LABEL) \
    $(wildcard include/config/TRACING) \
    $(wildcard include/config/EVENT_TRACING) \
    $(wildcard include/config/DYNAMIC_FTRACE) \
    $(wildcard include/config/KPROBES) \
    $(wildcard include/config/HAVE_STATIC_CALL_INLINE) \
    $(wildcard include/config/KUNIT) \
    $(wildcard include/config/PRINTK_INDEX) \
    $(wildcard include/config/CONSTRUCTORS) \
    $(wildcard include/config/FUNCTION_ERROR_INJECTION) \
    $(wildcard include/config/DYNAMIC_DEBUG_CORE) \
    $(wildcard include/config/MITIGATION_RETPOLINE) \
  /root/linux/include/linux/list.h \
    $(wildcard include/config/LIST_HARDENED) \
    $(wildcard include/config/DEBUG_LIST) \
  /root/linux/include/linux/container_of.h \
  /root/linux/include/linux/build_bug.h \
  /root/linux/include/linux/compiler.h \
    $(wildcard include/config/TRACE_BRANCH_PROFILING) \
    $(wildcard include/config/PROFILE_ALL_BRANCHES) \
    $(wildcard include/config/OBJTOOL) \
  /root/linux/arch/x86/include/generated/asm/rwonce.h \
  /root/linux/include/asm-generic/rwonce.h \
  /root/linux/include/linux/kasan-checks.h \
    $(wildcard include/config/KASAN_GENERIC) \
    $(wildcard include/config/KASAN_SW_TAGS) \
  /root/linux/include/linux/types.h \
    $(wildcard include/config/HAVE_UID16) \
    $(wildcard include/config/UID16) \
    $(wildcard include/config/ARCH_DMA_ADDR_T_64BIT) \
    $(wildcard include/config/PHYS_ADDR_T_64BIT) \
    $(wildcard include/config/64BIT) \
    $(wildcard include/config/ARCH_32BIT_USTAT_F_TINODE) \
  /root/linux/include/uapi/linux/types.h \
  /root/linux/arch/x86/include/generated/uapi/asm/types.h \
  /root/linux/include/uapi/asm-generic/types.h \
  /root/linux/include/asm-generic/int-ll64.h \
  /root/linux/include/uapi/asm-generic/int-ll64.h \
  /root/linux/arch/x86/include/uapi/asm/bitsperlong.h \
  /root/linux/include/asm-generic/bitsperlong.h \
  /root/linux/include/uapi/asm-generic/bitsperlong.h \
  /root/linux/include/uapi/linux/posix_types.h \
  /root/linux/include/linux/stddef.h \
  /root/linux/include/uapi/linux/stddef.h \
  /root/linux/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/X86_32) \
  /root/linux/arch/x86/include/uapi/asm/posix_types_64.h \
  /root/linux/include/uapi/asm-generic/posix_types.h \
  /root/linux/include/linux/kcsan-checks.h \
    $(wildcard include/config/KCSAN) \
    $(wildcard include/config/KCSAN_WEAK_MEMORY) \
    $(wildcard include/config/KCSAN_IGNORE_ATOMICS) \
  /root/linux/include/linux/poison.h \
    $(wildcard include/config/ILLEGAL_POINTER_VALUE) \
  /root/linux/include/linux/const.h \
  /root/linux/include/vdso/const.h \
  /root/linux/include/uapi/linux/const.h \
  /root/linux/arch/x86/include/asm/barrier.h \
  /root/linux/arch/x86/include/asm/alternative.h \
    $(wildcard include/config/CALL_THUNKS) \
    $(wildcard include/config/MITIGATION_ITS) \
    $(wildcard include/config/MITIGATION_RETHUNK) \
  /root/linux/include/linux/stringify.h \
  /root/linux/include/linux/objtool.h \
    $(wildcard include/config/FRAME_POINTER) \
    $(wildcard include/config/NOINSTR_VALIDATION) \
    $(wildcard include/config/MITIGATION_UNRET_ENTRY) \
    $(wildcard include/config/MITIGATION_SRSO) \
  /root/linux/include/linux/objtool_types.h \
  /root/linux/include/linux/annotate.h \
  /root/linux/arch/x86/include/asm/asm.h \
  /root/linux/arch/x86/include/asm/asm-offsets.h \
  /root/linux/include/generated/asm-offsets.h \
  /root/linux/arch/x86/include/asm/extable_fixup_types.h \
  /root/linux/arch/x86/include/asm/bug.h \
    $(wildcard include/config/DEBUG_BUGVERBOSE) \
    $(wildcard include/config/DEBUG_BUGVERBOSE_DETAILED) \
  /root/linux/include/linux/instrumentation.h \
  /root/linux/include/linux/static_call_types.h \
    $(wildcard include/config/HAVE_STATIC_CALL) \
  /root/linux/include/asm-generic/bug.h \
    $(wildcard include/config/BUG) \
    $(wildcard include/config/GENERIC_BUG_RELATIVE_POINTERS) \
  /root/linux/include/linux/once_lite.h \
  /root/linux/include/linux/panic.h \
    $(wildcard include/config/PANIC_TIMEOUT) \
  /root/linux/include/linux/stdarg.h \
  /root/linux/include/linux/printk.h \
    $(wildcard include/config/MESSAGE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_DEFAULT) \
    $(wildcard include/config/CONSOLE_LOGLEVEL_QUIET) \
    $(wildcard include/config/EARLY_PRINTK) \
    $(wildcard include/config/PRINTK) \
    $(wildcard include/config/DYNAMIC_DEBUG) \
  /root/linux/include/linux/init.h \
    $(wildcard include/config/MEMORY_HOTPLUG) \
    $(wildcard include/config/HAVE_ARCH_PREL32_RELOCATIONS) \
  /root/linux/include/linux/kern_levels.h \
  /root/linux/include/linux/linkage.h \
    $(wildcard include/config/ARCH_USE_SYM_ANNOTATIONS) \
  /root/linux/include/linux/export.h \
    $(wildcard include/config/MODVERSIONS) \
    $(wildcard include/config/GENDWARFKSYMS) \
  /root/linux/arch/x86/include/asm/linkage.h \
    $(wildcard include/config/CALL_PADDING) \
    $(wildcard include/config/MITIGATION_SLS) \
    $(wildcard include/config/FUNCTION_PADDING_BYTES) \
    $(wildcard include/config/UML) \
  /root/linux/arch/x86/include/asm/ibt.h \
    $(wildcard include/config/X86_KERNEL_IBT) \
  /root/linux/include/linux/ratelimit_types.h \
  /root/linux/include/linux/bits.h \
  /root/linux/include/vdso/bits.h \
  /root/linux/include/uapi/linux/bits.h \
  /root/linux/include/linux/overflow.h \
  /root/linux/include/linux/limits.h \
  /root/linux/include/uapi/linux/limits.h \
  /root/linux/include/vdso/limits.h \
  /root/linux/include/uapi/linux/param.h \
  /root/linux/arch/x86/include/generated/uapi/asm/param.h \
  /root/linux/include/asm-generic/param.h \
    $(wildcard include/config/HZ) \
  /root/linux/include/uapi/asm-generic/param.h \
  /root/linux/include/linux/spinlock_types_raw.h \
    $(wildcard include/config/DEBUG_SPINLOCK) \
    $(wildcard include/config/DEBUG_LOCK_ALLOC) \
  /root/linux/arch/x86/include/asm/spinlock_types.h \
  /root/linux/include/asm-generic/qspinlock_types.h \
    $(wildcard include/config/NR_CPUS) \
  /root/linux/include/asm-generic/qrwlock_types.h \
  /root/linux/arch/x86/include/uapi/asm/byteorder.h \
  /root/linux/include/linux/byteorder/little_endian.h \
  /root/linux/include/uapi/linux/byteorder/little_endian.h \
  /root/linux/include/linux/swab.h \
  /root/linux/include/uapi/linux/swab.h \
  /root/linux/arch/x86/include/uapi/asm/swab.h \
  /root/linux/include/linux/byteorder/generic.h \
  /root/linux/include/linux/lockdep_types.h \
    $(wildcard include/config/PROVE_RAW_LOCK_NESTING) \
    $(wildcard include/config/LOCKDEP) \
    $(wildcard include/config/LOCK_STAT) \
  /root/linux/arch/x86/include/asm/nops.h \
  /root/linux/include/asm-generic/barrier.h \
  /root/linux/include/linux/stat.h \
  /root/linux/arch/x86/include/uapi/asm/stat.h \
  /root/linux/include/uapi/linux/stat.h \
  /root/linux/include/linux/time.h \
    $(wildcard include/config/POSIX_TIMERS) \
  /root/linux/include/linux/cache.h \
    $(wildcard include/config/ARCH_HAS_CACHE_LINE_SIZE) \
  /root/linux/include/uapi/linux/kernel.h \
  /root/linux/include/uapi/linux/sysinfo.h \
  /root/linux/include/vdso/cache.h \
  /root/linux/arch/x86/include/asm/cache.h \
    $(wildcard include/config/X86_L1_CACHE_SHIFT) \
    $(wildcard include/config/X86_INTERNODE_CACHE_SHIFT) \
    $(wildcard include/config/X86_VSMP) \
  /root/linux/include/linux/math64.h \
    $(wildcard include/config/ARCH_SUPPORTS_INT128) \
  /root/linux/include/linux/math.h \
  /root/linux/arch/x86/include/asm/div64.h \
  /root/linux/include/asm-generic/div64.h \
    $(wildcard include/config/CC_OPTIMIZE_FOR_PERFORMANCE) \
  /root/linux/include/vdso/math64.h \
  /root/linux/include/linux/time64.h \
  /root/linux/include/vdso/time64.h \
  /root/linux/include/uapi/linux/time.h \
  /root/linux/include/uapi/linux/time_types.h \
  /root/linux/include/linux/time32.h \
  /root/linux/include/linux/timex.h \
  /root/linux/include/uapi/linux/timex.h \
  /root/linux/arch/x86/include/asm/timex.h \
    $(wildcard include/config/X86_TSC) \
  /root/linux/arch/x86/include/asm/processor.h \
    $(wildcard include/config/X86_VMX_FEATURE_NAMES) \
    $(wildcard include/config/X86_IOPL_IOPERM) \
    $(wildcard include/config/VM86) \
    $(wildcard include/config/X86_USER_SHADOW_STACK) \
    $(wildcard include/config/X86_DEBUG_FPU) \
    $(wildcard include/config/USE_X86_SEG_SUPPORT) \
    $(wildcard include/config/PARAVIRT_XXL) \
    $(wildcard include/config/CPU_SUP_AMD) \
    $(wildcard include/config/XEN) \
  /root/linux/arch/x86/include/asm/processor-flags.h \
    $(wildcard include/config/MITIGATION_PAGE_TABLE_ISOLATION) \
  /root/linux/arch/x86/include/uapi/asm/processor-flags.h \
  /root/linux/include/linux/mem_encrypt.h \
    $(wildcard include/config/ARCH_HAS_MEM_ENCRYPT) \
    $(wildcard include/config/AMD_MEM_ENCRYPT) \
  /root/linux/arch/x86/include/asm/mem_encrypt.h \
    $(wildcard include/config/X86_MEM_ENCRYPT) \
  /root/linux/include/linux/cc_platform.h \
    $(wildcard include/config/ARCH_HAS_CC_PLATFORM) \
  /root/linux/arch/x86/include/asm/math_emu.h \
  /root/linux/arch/x86/include/asm/ptrace.h \
    $(wildcard include/config/PARAVIRT) \
    $(wildcard include/config/IA32_EMULATION) \
    $(wildcard include/config/X86_DEBUGCTLMSR) \
  /root/linux/arch/x86/include/asm/segment.h \
    $(wildcard include/config/XEN_PV) \
  /root/linux/arch/x86/include/asm/page_types.h \
    $(wildcard include/config/PHYSICAL_START) \
    $(wildcard include/config/PHYSICAL_ALIGN) \
    $(wildcard include/config/DYNAMIC_PHYSICAL_MASK) \
  /root/linux/include/vdso/page.h \
    $(wildcard include/config/PAGE_SHIFT) \
  /root/linux/arch/x86/include/asm/page_64_types.h \
    $(wildcard include/config/KASAN) \
    $(wildcard include/config/RANDOMIZE_BASE) \
  /root/linux/arch/x86/include/asm/kaslr.h \
    $(wildcard include/config/RANDOMIZE_MEMORY) \
  /root/linux/arch/x86/include/uapi/asm/ptrace.h \
  /root/linux/arch/x86/include/uapi/asm/ptrace-abi.h \
  /root/linux/arch/x86/include/asm/paravirt_types.h \
    $(wildcard include/config/ZERO_CALL_USED_REGS) \
    $(wildcard include/config/PARAVIRT_DEBUG) \
  /root/linux/arch/x86/include/asm/desc_defs.h \
  /root/linux/arch/x86/include/asm/pgtable_types.h \
    $(wildcard include/config/X86_INTEL_MEMORY_PROTECTION_KEYS) \
    $(wildcard include/config/X86_PAE) \
    $(wildcard include/config/MEM_SOFT_DIRTY) \
    $(wildcard include/config/HAVE_ARCH_USERFAULTFD_WP) \
    $(wildcard include/config/PGTABLE_LEVELS) \
    $(wildcard include/config/PROC_FS) \
  /root/linux/arch/x86/include/asm/pgtable_64_types.h \
    $(wildcard include/config/KMSAN) \
    $(wildcard include/config/DEBUG_KMAP_LOCAL_FORCE_MAP) \
  /root/linux/arch/x86/include/asm/sparsemem.h \
    $(wildcard include/config/SPARSEMEM) \
  /root/linux/arch/x86/include/asm/nospec-branch.h \
    $(wildcard include/config/CALL_THUNKS_DEBUG) \
    $(wildcard include/config/MITIGATION_CALL_DEPTH_TRACKING) \
    $(wildcard include/config/MITIGATION_IBPB_ENTRY) \
  /root/linux/include/linux/static_key.h \
  /root/linux/include/linux/jump_label.h \
    $(wildcard include/config/HAVE_ARCH_JUMP_LABEL_RELATIVE) \
  /root/linux/include/linux/cleanup.h \
  /root/linux/include/linux/err.h \
  /root/linux/arch/x86/include/generated/uapi/asm/errno.h \
  /root/linux/include/uapi/asm-generic/errno.h \
  /root/linux/include/uapi/asm-generic/errno-base.h \
  /root/linux/include/linux/args.h \
  /root/linux/arch/x86/include/asm/jump_label.h \
    $(wildcard include/config/HAVE_JUMP_LABEL_HACK) \
  /root/linux/arch/x86/include/asm/cpufeatures.h \
  /root/linux/arch/x86/include/asm/msr-index.h \
  /root/linux/arch/x86/include/asm/unwind_hints.h \
  /root/linux/arch/x86/include/asm/orc_types.h \
  /root/linux/arch/x86/include/asm/percpu.h \
    $(wildcard include/config/CC_HAS_NAMED_AS) \
  /root/linux/include/asm-generic/percpu.h \
    $(wildcard include/config/DEBUG_PREEMPT) \
    $(wildcard include/config/HAVE_SETUP_PER_CPU_AREA) \
  /root/linux/include/linux/threads.h \
    $(wildcard include/config/BASE_SMALL) \
  /root/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/ARCH_MODULE_NEEDS_WEAK_PER_CPU) \
    $(wildcard include/config/DEBUG_FORCE_WEAK_PER_CPU) \
  /root/linux/arch/x86/include/asm/GEN-for-each-reg.h \
  /root/linux/arch/x86/include/asm/proto.h \
  /root/linux/arch/x86/include/uapi/asm/ldt.h \
  /root/linux/arch/x86/include/uapi/asm/sigcontext.h \
  /root/linux/arch/x86/include/asm/current.h \
  /root/linux/arch/x86/include/asm/cpuid/api.h \
  /root/linux/arch/x86/include/asm/cpuid/types.h \
  /root/linux/arch/x86/include/asm/string.h \
  /root/linux/arch/x86/include/asm/string_64.h \
    $(wildcard include/config/ARCH_HAS_UACCESS_FLUSHCACHE) \
  /root/linux/arch/x86/include/asm/page.h \
  /root/linux/arch/x86/include/asm/page_64.h \
    $(wildcard include/config/DEBUG_VIRTUAL) \
    $(wildcard include/config/X86_VSYSCALL_EMULATION) \
  /root/linux/include/linux/kmsan-checks.h \
  /root/linux/include/linux/mmdebug.h \
    $(wildcard include/config/DEBUG_VM) \
    $(wildcard include/config/DEBUG_VM_IRQSOFF) \
    $(wildcard include/config/DEBUG_VM_PGFLAGS) \
  /root/linux/include/linux/bug.h \
    $(wildcard include/config/BUG_ON_DATA_CORRUPTION) \
  /root/linux/include/linux/range.h \
  /root/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/FLATMEM) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP) \
  /root/linux/include/linux/pfn.h \
  /root/linux/include/asm-generic/getorder.h \
  /root/linux/include/linux/log2.h \
    $(wildcard include/config/ARCH_HAS_ILOG2_U32) \
    $(wildcard include/config/ARCH_HAS_ILOG2_U64) \
  /root/linux/include/linux/bitops.h \
  /root/linux/include/linux/typecheck.h \
  /root/linux/include/asm-generic/bitops/generic-non-atomic.h \
  /root/linux/arch/x86/include/asm/bitops.h \
    $(wildcard include/config/X86_CMOV) \
  /root/linux/arch/x86/include/asm/rmwcc.h \
  /root/linux/include/asm-generic/bitops/sched.h \
  /root/linux/arch/x86/include/asm/arch_hweight.h \
  /root/linux/include/asm-generic/bitops/const_hweight.h \
  /root/linux/include/asm-generic/bitops/instrumented-atomic.h \
  /root/linux/include/linux/instrumented.h \
  /root/linux/include/asm-generic/bitops/instrumented-non-atomic.h \
    $(wildcard include/config/KCSAN_ASSUME_PLAIN_WRITES_ATOMIC) \
  /root/linux/include/asm-generic/bitops/instrumented-lock.h \
  /root/linux/include/asm-generic/bitops/le.h \
  /root/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /root/linux/arch/x86/include/asm/special_insns.h \
  /root/linux/include/linux/errno.h \
  /root/linux/include/uapi/linux/errno.h \
  /root/linux/include/linux/irqflags.h \
    $(wildcard include/config/PROVE_LOCKING) \
    $(wildcard include/config/TRACE_IRQFLAGS) \
    $(wildcard include/config/PREEMPT_RT) \
    $(wildcard include/config/IRQSOFF_TRACER) \
    $(wildcard include/config/PREEMPT_TRACER) \
    $(wildcard include/config/DEBUG_IRQFLAGS) \
    $(wildcard include/config/TRACE_IRQFLAGS_SUPPORT) \
  /root/linux/include/linux/irqflags_types.h \
  /root/linux/arch/x86/include/asm/irqflags.h \
    $(wildcard include/config/DEBUG_ENTRY) \
  /root/linux/arch/x86/include/asm/fpu/types.h \
  /root/linux/arch/x86/include/asm/vmxfeatures.h \
  /root/linux/arch/x86/include/asm/vdso/processor.h \
  /root/linux/arch/x86/include/asm/shstk.h \
  /root/linux/include/linux/personality.h \
  /root/linux/include/uapi/linux/personality.h \
  /root/linux/arch/x86/include/asm/tsc.h \
  /root/linux/arch/x86/include/asm/cpufeature.h \
  /root/linux/arch/x86/include/generated/asm/cpufeaturemasks.h \
  /root/linux/arch/x86/include/asm/msr.h \
  /root/linux/arch/x86/include/asm/cpumask.h \
  /root/linux/include/linux/cpumask.h \
    $(wildcard include/config/FORCE_NR_CPUS) \
    $(wildcard include/config/HOTPLUG_CPU) \
    $(wildcard include/config/DEBUG_PER_CPU_MAPS) \
    $(wildcard include/config/CPUMASK_OFFSTACK) \
  /root/linux/include/linux/atomic.h \
  /root/linux/arch/x86/include/asm/atomic.h \
  /root/linux/arch/x86/include/asm/cmpxchg.h \
  /root/linux/arch/x86/include/asm/cmpxchg_64.h \
  /root/linux/arch/x86/include/asm/atomic64_64.h \
  /root/linux/include/linux/atomic/atomic-arch-fallback.h \
    $(wildcard include/config/GENERIC_ATOMIC64) \
  /root/linux/include/linux/atomic/atomic-long.h \
  /root/linux/include/linux/atomic/atomic-instrumented.h \
  /root/linux/include/linux/bitmap.h \
  /root/linux/include/linux/align.h \
  /root/linux/include/vdso/align.h \
  /root/linux/include/linux/find.h \
  /root/linux/include/linux/string.h \
    $(wildcard include/config/BINARY_PRINTF) \
    $(wildcard include/config/FORTIFY_SOURCE) \
  /root/linux/include/linux/array_size.h \
  /root/linux/include/uapi/linux/string.h \
  /root/linux/include/linux/bitmap-str.h \
  /root/linux/include/linux/cpumask_types.h \
  /root/linux/include/linux/gfp_types.h \
    $(wildcard include/config/KASAN_HW_TAGS) \
  /root/linux/include/linux/numa.h \
    $(wildcard include/config/NUMA_KEEP_MEMINFO) \
    $(wildcard include/config/NUMA) \
    $(wildcard include/config/HAVE_ARCH_NODE_DEV_GROUP) \
  /root/linux/include/linux/nodemask.h \
    $(wildcard include/config/HIGHMEM) \
  /root/linux/include/linux/minmax.h \
  /root/linux/include/linux/nodemask_types.h \
    $(wildcard include/config/NODES_SHIFT) \
  /root/linux/include/linux/random.h \
    $(wildcard include/config/VMGENID) \
  /root/linux/include/linux/kernel.h \
    $(wildcard include/config/PREEMPT_VOLUNTARY_BUILD) \
    $(wildcard include/config/PREEMPT_DYNAMIC) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_CALL) \
    $(wildcard include/config/HAVE_PREEMPT_DYNAMIC_KEY) \
    $(wildcard include/config/PREEMPT_) \
    $(wildcard include/config/DEBUG_ATOMIC_SLEEP) \
    $(wildcard include/config/MMU) \
  /root/linux/include/linux/hex.h \
  /root/linux/include/linux/kstrtox.h \
  /root/linux/include/linux/sprintf.h \
  /root/linux/include/linux/instruction_pointer.h \
  /root/linux/include/linux/util_macros.h \
    $(wildcard include/config/FOO_SUSPEND) \
  /root/linux/include/linux/wordpart.h \
  /root/linux/include/uapi/linux/random.h \
  /root/linux/include/uapi/linux/ioctl.h \
  /root/linux/arch/x86/include/generated/uapi/asm/ioctl.h \
  /root/linux/include/asm-generic/ioctl.h \
  /root/linux/include/uapi/asm-generic/ioctl.h \
  /root/linux/include/linux/irqnr.h \
  /root/linux/include/uapi/linux/irqnr.h \
  /root/linux/arch/x86/include/uapi/asm/msr.h \
  /root/linux/arch/x86/include/asm/shared/msr.h \
  /root/linux/include/linux/percpu.h \
    $(wildcard include/config/RANDOM_KMALLOC_CACHES) \
    $(wildcard include/config/PAGE_SIZE_4KB) \
    $(wildcard include/config/NEED_PER_CPU_PAGE_FIRST_CHUNK) \
  /root/linux/include/linux/alloc_tag.h \
    $(wildcard include/config/MEM_ALLOC_PROFILING_DEBUG) \
    $(wildcard include/config/MEM_ALLOC_PROFILING) \
    $(wildcard include/config/MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT) \
  /root/linux/include/linux/codetag.h \
    $(wildcard include/config/CODE_TAGGING) \
  /root/linux/include/linux/preempt.h \
    $(wildcard include/config/PREEMPT_COUNT) \
    $(wildcard include/config/TRACE_PREEMPT_TOGGLE) \
    $(wildcard include/config/PREEMPTION) \
    $(wildcard include/config/PREEMPT_NOTIFIERS) \
    $(wildcard include/config/PREEMPT_NONE) \
    $(wildcard include/config/PREEMPT_VOLUNTARY) \
    $(wildcard include/config/PREEMPT) \
    $(wildcard include/config/PREEMPT_LAZY) \
  /root/linux/arch/x86/include/asm/preempt.h \
  /root/linux/include/linux/smp.h \
    $(wildcard include/config/UP_LATE_INIT) \
    $(wildcard include/config/CSD_LOCK_WAIT_DEBUG) \
  /root/linux/include/linux/smp_types.h \
  /root/linux/include/linux/llist.h \
    $(wildcard include/config/ARCH_HAVE_NMI_SAFE_CMPXCHG) \
  /root/linux/include/linux/thread_info.h \
    $(wildcard include/config/THREAD_INFO_IN_TASK) \
    $(wildcard include/config/GENERIC_ENTRY) \
    $(wildcard include/config/ARCH_HAS_PREEMPT_LAZY) \
    $(wildcard include/config/HAVE_ARCH_WITHIN_STACK_FRAMES) \
    $(wildcard include/config/SH) \
  /root/linux/include/linux/restart_block.h \
  /root/linux/arch/x86/include/asm/thread_info.h \
    $(wildcard include/config/X86_FRED) \
    $(wildcard include/config/COMPAT) \
  /root/linux/include/asm-generic/thread_info_tif.h \
  /root/linux/arch/x86/include/asm/smp.h \
    $(wildcard include/config/DEBUG_NMI_SELFTEST) \
  /root/linux/include/linux/sched.h \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_NATIVE) \
    $(wildcard include/config/SCHED_INFO) \
    $(wildcard include/config/SCHEDSTATS) \
    $(wildcard include/config/SCHED_CORE) \
    $(wildcard include/config/FAIR_GROUP_SCHED) \
    $(wildcard include/config/RT_GROUP_SCHED) \
    $(wildcard include/config/RT_MUTEXES) \
    $(wildcard include/config/UCLAMP_TASK) \
    $(wildcard include/config/UCLAMP_BUCKETS_COUNT) \
    $(wildcard include/config/KMAP_LOCAL) \
    $(wildcard include/config/SCHED_CLASS_EXT) \
    $(wildcard include/config/CGROUP_SCHED) \
    $(wildcard include/config/CFS_BANDWIDTH) \
    $(wildcard include/config/BLK_DEV_IO_TRACE) \
    $(wildcard include/config/PREEMPT_RCU) \
    $(wildcard include/config/TASKS_RCU) \
    $(wildcard include/config/TASKS_TRACE_RCU) \
    $(wildcard include/config/MEMCG_V1) \
    $(wildcard include/config/LRU_GEN) \
    $(wildcard include/config/COMPAT_BRK) \
    $(wildcard include/config/CGROUPS) \
    $(wildcard include/config/BLK_CGROUP) \
    $(wildcard include/config/PSI) \
    $(wildcard include/config/PAGE_OWNER) \
    $(wildcard include/config/EVENTFD) \
    $(wildcard include/config/ARCH_HAS_CPU_PASID) \
    $(wildcard include/config/X86_BUS_LOCK_DETECT) \
    $(wildcard include/config/TASK_DELAY_ACCT) \
    $(wildcard include/config/STACKPROTECTOR) \
    $(wildcard include/config/ARCH_HAS_SCALED_CPUTIME) \
    $(wildcard include/config/VIRT_CPU_ACCOUNTING_GEN) \
    $(wildcard include/config/NO_HZ_FULL) \
    $(wildcard include/config/POSIX_CPUTIMERS) \
    $(wildcard include/config/POSIX_CPU_TIMERS_TASK_WORK) \
    $(wildcard include/config/KEYS) \
    $(wildcard include/config/SYSVIPC) \
    $(wildcard include/config/DETECT_HUNG_TASK) \
    $(wildcard include/config/IO_URING) \
    $(wildcard include/config/AUDIT) \
    $(wildcard include/config/AUDITSYSCALL) \
    $(wildcard include/config/DETECT_HUNG_TASK_BLOCKER) \
    $(wildcard include/config/UBSAN) \
    $(wildcard include/config/UBSAN_TRAP) \
    $(wildcard include/config/COMPACTION) \
    $(wildcard include/config/TASK_XACCT) \
    $(wildcard include/config/CPUSETS) \
    $(wildcard include/config/X86_CPU_RESCTRL) \
    $(wildcard include/config/FUTEX) \
    $(wildcard include/config/PERF_EVENTS) \
    $(wildcard include/config/NUMA_BALANCING) \
    $(wildcard include/config/FAULT_INJECTION) \
    $(wildcard include/config/LATENCYTOP) \
    $(wildcard include/config/FUNCTION_GRAPH_TRACER) \
    $(wildcard include/config/MEMCG) \
    $(wildcard include/config/UPROBES) \
    $(wildcard include/config/BCACHE) \
    $(wildcard include/config/VMAP_STACK) \
    $(wildcard include/config/SECURITY) \
    $(wildcard include/config/BPF_SYSCALL) \
    $(wildcard include/config/KSTACK_ERASE) \
    $(wildcard include/config/KSTACK_ERASE_METRICS) \
    $(wildcard include/config/X86_MCE) \
    $(wildcard include/config/KRETPROBES) \
    $(wildcard include/config/RETHOOK) \
    $(wildcard include/config/ARCH_HAS_PARANOID_L1D_FLUSH) \
    $(wildcard include/config/RV) \
    $(wildcard include/config/RV_PER_TASK_MONITORS) \
    $(wildcard include/config/USER_EVENTS) \
    $(wildcard include/config/UNWIND_USER) \
    $(wildcard include/config/SCHED_PROXY_EXEC) \
    $(wildcard include/config/SCHED_MM_CID) \
  /root/linux/include/uapi/linux/sched.h \
  /root/linux/include/linux/pid_types.h \
  /root/linux/include/linux/sem_types.h \
  /root/linux/include/linux/shm.h \
  /root/linux/arch/x86/include/asm/shmparam.h \
  /root/linux/include/linux/kmsan_types.h \
  /root/linux/include/linux/mutex_types.h \
    $(wildcard include/config/MUTEX_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_MUTEXES) \
  /root/linux/include/linux/osq_lock.h \
  /root/linux/include/linux/spinlock_types.h \
  /root/linux/include/linux/rwlock_types.h \
  /root/linux/include/linux/plist_types.h \
  /root/linux/include/linux/hrtimer_types.h \
  /root/linux/include/linux/timerqueue_types.h \
  /root/linux/include/linux/rbtree_types.h \
  /root/linux/include/linux/timer_types.h \
  /root/linux/include/linux/seccomp_types.h \
    $(wildcard include/config/SECCOMP) \
  /root/linux/include/linux/refcount_types.h \
  /root/linux/include/linux/resource.h \
  /root/linux/include/uapi/linux/resource.h \
  /root/linux/arch/x86/include/generated/uapi/asm/resource.h \
  /root/linux/include/asm-generic/resource.h \
  /root/linux/include/uapi/asm-generic/resource.h \
  /root/linux/include/linux/latencytop.h \
  /root/linux/include/linux/sched/prio.h \
  /root/linux/include/linux/sched/types.h \
  /root/linux/include/linux/signal_types.h \
    $(wildcard include/config/OLD_SIGACTION) \
  /root/linux/include/uapi/linux/signal.h \
  /root/linux/arch/x86/include/asm/signal.h \
  /root/linux/arch/x86/include/uapi/asm/signal.h \
  /root/linux/include/uapi/asm-generic/signal-defs.h \
  /root/linux/arch/x86/include/uapi/asm/siginfo.h \
  /root/linux/include/uapi/asm-generic/siginfo.h \
  /root/linux/include/linux/spinlock.h \
  /root/linux/include/linux/bottom_half.h \
  /root/linux/include/linux/lockdep.h \
    $(wildcard include/config/DEBUG_LOCKING_API_SELFTESTS) \
  /root/linux/arch/x86/include/generated/asm/mmiowb.h \
  /root/linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/MMIOWB) \
  /root/linux/arch/x86/include/asm/spinlock.h \
  /root/linux/arch/x86/include/asm/paravirt.h \
    $(wildcard include/config/PARAVIRT_SPINLOCKS) \
  /root/linux/arch/x86/include/asm/frame.h \
  /root/linux/arch/x86/include/asm/qspinlock.h \
  /root/linux/include/asm-generic/qspinlock.h \
  /root/linux/arch/x86/include/asm/qrwlock.h \
  /root/linux/include/asm-generic/qrwlock.h \
  /root/linux/include/linux/rwlock.h \
  /root/linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/INLINE_SPIN_LOCK) \
    $(wildcard include/config/INLINE_SPIN_LOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK) \
    $(wildcard include/config/INLINE_SPIN_TRYLOCK_BH) \
    $(wildcard include/config/UNINLINE_SPIN_UNLOCK) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_BH) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_SPIN_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/GENERIC_LOCKBREAK) \
  /root/linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/INLINE_READ_LOCK) \
    $(wildcard include/config/INLINE_WRITE_LOCK) \
    $(wildcard include/config/INLINE_READ_LOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_LOCK_BH) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_WRITE_LOCK_IRQSAVE) \
    $(wildcard include/config/INLINE_READ_TRYLOCK) \
    $(wildcard include/config/INLINE_WRITE_TRYLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK) \
    $(wildcard include/config/INLINE_READ_UNLOCK_BH) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_BH) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQ) \
    $(wildcard include/config/INLINE_READ_UNLOCK_IRQRESTORE) \
    $(wildcard include/config/INLINE_WRITE_UNLOCK_IRQRESTORE) \
  /root/linux/include/linux/syscall_user_dispatch_types.h \
  /root/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH) \
  /root/linux/arch/x86/include/asm/tlbbatch.h \
  /root/linux/include/linux/netdevice_xmit.h \
    $(wildcard include/config/NET_ACT_MIRRED) \
    $(wildcard include/config/NET_EGRESS) \
    $(wildcard include/config/NF_DUP_NETDEV) \
  /root/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/TASK_IO_ACCOUNTING) \
  /root/linux/include/linux/posix-timers_types.h \
  /root/linux/include/linux/rseq_types.h \
    $(wildcard include/config/RSEQ) \
  /root/linux/include/linux/irq_work_types.h \
  /root/linux/include/linux/workqueue_types.h \
  /root/linux/include/linux/seqlock_types.h \
  /root/linux/include/linux/kcsan.h \
  /root/linux/include/linux/rv.h \
    $(wildcard include/config/RV_LTL_MONITOR) \
    $(wildcard include/config/RV_REACTORS) \
  /root/linux/include/linux/uidgid_types.h \
  /root/linux/include/linux/tracepoint-defs.h \
  /root/linux/include/linux/unwind_deferred_types.h \
  /root/linux/arch/x86/include/generated/asm/kmap_size.h \
  /root/linux/include/asm-generic/kmap_size.h \
    $(wildcard include/config/DEBUG_KMAP_LOCAL) \
  /root/linux/include/generated/rq-offsets.h \
  /root/linux/include/linux/sched/ext.h \
    $(wildcard include/config/EXT_GROUP_SCHED) \
  /root/linux/include/vdso/time32.h \
  /root/linux/include/vdso/time.h \
  /root/linux/include/linux/uidgid.h \
    $(wildcard include/config/MULTIUSER) \
    $(wildcard include/config/USER_NS) \
  /root/linux/include/linux/highuid.h \
  /root/linux/include/linux/buildid.h \
    $(wildcard include/config/VMCORE_INFO) \
  /root/linux/include/linux/kmod.h \
  /root/linux/include/linux/umh.h \
  /root/linux/include/linux/gfp.h \
    $(wildcard include/config/ZONE_DMA) \
    $(wildcard include/config/ZONE_DMA32) \
    $(wildcard include/config/ZONE_DEVICE) \
    $(wildcard include/config/CONTIG_ALLOC) \
  /root/linux/include/linux/mmzone.h \
    $(wildcard include/config/ARCH_FORCE_MAX_ORDER) \
    $(wildcard include/config/PAGE_BLOCK_MAX_ORDER) \
    $(wildcard include/config/CMA) \
    $(wildcard include/config/MEMORY_ISOLATION) \
    $(wildcard include/config/ZSMALLOC) \
    $(wildcard include/config/UNACCEPTED_MEMORY) \
    $(wildcard include/config/IOMMU_SUPPORT) \
    $(wildcard include/config/SWAP) \
    $(wildcard include/config/HUGETLB_PAGE) \
    $(wildcard include/config/TRANSPARENT_HUGEPAGE) \
    $(wildcard include/config/LRU_GEN_STATS) \
    $(wildcard include/config/LRU_GEN_WALKS_MMU) \
    $(wildcard include/config/MEMORY_FAILURE) \
    $(wildcard include/config/PAGE_EXTENSION) \
    $(wildcard include/config/DEFERRED_STRUCT_PAGE_INIT) \
    $(wildcard include/config/HAVE_MEMORYLESS_NODES) \
    $(wildcard include/config/SPARSEMEM_EXTREME) \
    $(wildcard include/config/SPARSEMEM_VMEMMAP_PREINIT) \
    $(wildcard include/config/HAVE_ARCH_PFN_VALID) \
  /root/linux/include/linux/list_nulls.h \
  /root/linux/include/linux/wait.h \
  /root/linux/include/linux/seqlock.h \
    $(wildcard include/config/CC_IS_GCC) \
    $(wildcard include/config/GCC_VERSION) \
  /root/linux/include/linux/mutex.h \
  /root/linux/include/linux/debug_locks.h \
  /root/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/HUGETLB_PAGE_SIZE_VARIABLE) \
  /root/linux/include/linux/page-flags-layout.h \
  /root/linux/include/generated/bounds.h \
  /root/linux/include/linux/mm_types.h \
    $(wildcard include/config/HAVE_ALIGNED_STRUCT_PAGE) \
    $(wildcard include/config/SLAB_OBJ_EXT) \
    $(wildcard include/config/HUGETLB_PMD_PAGE_TABLE_SHARING) \
    $(wildcard include/config/SLAB_FREELIST_HARDENED) \
    $(wildcard include/config/USERFAULTFD) \
    $(wildcard include/config/ANON_VMA_NAME) \
    $(wildcard include/config/PER_VMA_LOCK) \
    $(wildcard include/config/HAVE_ARCH_COMPAT_MMAP_BASES) \
    $(wildcard include/config/MEMBARRIER) \
    $(wildcard include/config/FUTEX_PRIVATE_HASH) \
    $(wildcard include/config/ARCH_HAS_ELF_CORE_EFLAGS) \
    $(wildcard include/config/AIO) \
    $(wildcard include/config/MMU_NOTIFIER) \
    $(wildcard include/config/SPLIT_PMD_PTLOCKS) \
    $(wildcard include/config/IOMMU_MM_DATA) \
    $(wildcard include/config/KSM) \
    $(wildcard include/config/MM_ID) \
    $(wildcard include/config/CORE_DUMP_DEFAULT_ELF_HEADERS) \
  /root/linux/include/linux/auxvec.h \
  /root/linux/include/uapi/linux/auxvec.h \
  /root/linux/arch/x86/include/uapi/asm/auxvec.h \
  /root/linux/include/linux/kref.h \
  /root/linux/include/linux/refcount.h \
  /root/linux/include/linux/rbtree.h \
  /root/linux/include/linux/rcupdate.h \
    $(wildcard include/config/TINY_RCU) \
    $(wildcard include/config/RCU_STRICT_GRACE_PERIOD) \
    $(wildcard include/config/RCU_LAZY) \
    $(wildcard include/config/RCU_STALL_COMMON) \
    $(wildcard include/config/VIRT_XFER_TO_GUEST_WORK) \
    $(wildcard include/config/RCU_NOCB_CPU) \
    $(wildcard include/config/TASKS_RCU_GENERIC) \
    $(wildcard include/config/TASKS_RUDE_RCU) \
    $(wildcard include/config/TREE_RCU) \
    $(wildcard include/config/DEBUG_OBJECTS_RCU_HEAD) \
    $(wildcard include/config/PROVE_RCU) \
    $(wildcard include/config/ARCH_WEAK_RELEASE_ACQUIRE) \
  /root/linux/include/linux/context_tracking_irq.h \
    $(wildcard include/config/CONTEXT_TRACKING_IDLE) \
  /root/linux/include/linux/rcutree.h \
  /root/linux/include/linux/maple_tree.h \
    $(wildcard include/config/MAPLE_RCU_DISABLED) \
    $(wildcard include/config/DEBUG_MAPLE_TREE) \
  /root/linux/include/linux/rwsem.h \
    $(wildcard include/config/RWSEM_SPIN_ON_OWNER) \
    $(wildcard include/config/DEBUG_RWSEMS) \
  /root/linux/include/linux/completion.h \
  /root/linux/include/linux/swait.h \
  /root/linux/include/linux/uprobes.h \
  /root/linux/include/linux/timer.h \
    $(wildcard include/config/DEBUG_OBJECTS_TIMERS) \
    $(wildcard include/config/NO_HZ_COMMON) \
  /root/linux/include/linux/ktime.h \
  /root/linux/include/linux/jiffies.h \
  /root/linux/include/vdso/jiffies.h \
  /root/linux/include/generated/timeconst.h \
  /root/linux/include/vdso/ktime.h \
  /root/linux/include/linux/timekeeping.h \
    $(wildcard include/config/POSIX_AUX_CLOCKS) \
    $(wildcard include/config/GENERIC_CMOS_UPDATE) \
  /root/linux/include/linux/clocksource_ids.h \
  /root/linux/include/linux/debugobjects.h \
    $(wildcard include/config/DEBUG_OBJECTS) \
    $(wildcard include/config/DEBUG_OBJECTS_FREE) \
  /root/linux/arch/x86/include/asm/uprobes.h \
  /root/linux/include/linux/notifier.h \
  /root/linux/include/linux/srcu.h \
    $(wildcard include/config/TINY_SRCU) \
    $(wildcard include/config/NEED_SRCU_NMI_SAFE) \
  /root/linux/include/linux/workqueue.h \
    $(wildcard include/config/DEBUG_OBJECTS_WORK) \
    $(wildcard include/config/FREEZER) \
    $(wildcard include/config/WQ_WATCHDOG) \
  /root/linux/include/linux/rcu_segcblist.h \
  /root/linux/include/linux/srcutree.h \
  /root/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/RCU_FANOUT) \
    $(wildcard include/config/RCU_FANOUT_LEAF) \
  /root/linux/include/linux/percpu_counter.h \
  /root/linux/arch/x86/include/asm/mmu.h \
    $(wildcard include/config/MODIFY_LDT_SYSCALL) \
    $(wildcard include/config/ADDRESS_MASKING) \
    $(wildcard include/config/BROADCAST_TLB_FLUSH) \
  /root/linux/include/linux/page-flags.h \
    $(wildcard include/config/PAGE_IDLE_FLAG) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_2) \
    $(wildcard include/config/ARCH_USES_PG_ARCH_3) \
    $(wildcard include/config/MIGRATION) \
    $(wildcard include/config/HUGETLB_PAGE_OPTIMIZE_VMEMMAP) \
  /root/linux/include/linux/local_lock.h \
  /root/linux/include/linux/local_lock_internal.h \
  /root/linux/include/linux/zswap.h \
    $(wildcard include/config/ZSWAP) \
  /root/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/ARCH_HAS_ADD_PAGES) \
    $(wildcard include/config/MEMORY_HOTREMOVE) \
  /root/linux/arch/x86/include/generated/asm/mmzone.h \
  /root/linux/include/asm-generic/mmzone.h \
  /root/linux/include/linux/topology.h \
    $(wildcard include/config/USE_PERCPU_NUMA_NODE_ID) \
    $(wildcard include/config/SCHED_SMT) \
    $(wildcard include/config/GENERIC_ARCH_TOPOLOGY) \
  /root/linux/include/linux/arch_topology.h \
  /root/linux/arch/x86/include/asm/topology.h \
    $(wildcard include/config/X86_LOCAL_APIC) \
    $(wildcard include/config/SCHED_MC_PRIO) \
  /root/linux/arch/x86/include/asm/mpspec.h \
    $(wildcard include/config/EISA) \
    $(wildcard include/config/X86_MPPARSE) \
  /root/linux/arch/x86/include/asm/mpspec_def.h \
  /root/linux/arch/x86/include/asm/x86_init.h \
  /root/linux/arch/x86/include/asm/apicdef.h \
  /root/linux/include/asm-generic/topology.h \
  /root/linux/include/linux/cpu_smt.h \
    $(wildcard include/config/HOTPLUG_SMT) \
  /root/linux/include/linux/sysctl.h \
    $(wildcard include/config/SYSCTL) \
  /root/linux/include/uapi/linux/sysctl.h \
  /root/linux/include/linux/elf.h \
    $(wildcard include/config/ARCH_HAVE_EXTRA_ELF_NOTES) \
    $(wildcard include/config/ARCH_USE_GNU_PROPERTY) \
    $(wildcard include/config/ARCH_HAVE_ELF_PROT) \
  /root/linux/arch/x86/include/asm/elf.h \
    $(wildcard include/config/X86_X32_ABI) \
  /root/linux/arch/x86/include/asm/ia32.h \
  /root/linux/include/linux/compat.h \
    $(wildcard include/config/ARCH_HAS_SYSCALL_WRAPPER) \
    $(wildcard include/config/COMPAT_OLD_SIGACTION) \
    $(wildcard include/config/HARDENED_USERCOPY) \
    $(wildcard include/config/ODD_RT_SIGACTION) \
  /root/linux/include/linux/sem.h \
  /root/linux/include/uapi/linux/sem.h \
  /root/linux/include/linux/ipc.h \
  /root/linux/include/linux/rhashtable-types.h \
  /root/linux/include/uapi/linux/ipc.h \
  /root/linux/arch/x86/include/generated/uapi/asm/ipcbuf.h \
  /root/linux/include/uapi/asm-generic/ipcbuf.h \
  /root/linux/arch/x86/include/uapi/asm/sembuf.h \
  /root/linux/include/linux/socket.h \
  /root/linux/arch/x86/include/generated/uapi/asm/socket.h \
  /root/linux/include/uapi/asm-generic/socket.h \
  /root/linux/arch/x86/include/generated/uapi/asm/sockios.h \
  /root/linux/include/uapi/asm-generic/sockios.h \
  /root/linux/include/uapi/linux/sockios.h \
  /root/linux/include/linux/uio.h \
    $(wildcard include/config/ARCH_HAS_COPY_MC) \
  /root/linux/include/linux/ucopysize.h \
    $(wildcard include/config/HARDENED_USERCOPY_DEFAULT_ON) \
  /root/linux/include/uapi/linux/uio.h \
  /root/linux/include/uapi/linux/socket.h \
  /root/linux/include/uapi/linux/if.h \
  /root/linux/include/uapi/linux/libc-compat.h \
  /root/linux/include/uapi/linux/hdlc/ioctl.h \
  /root/linux/include/linux/fs.h \
    $(wildcard include/config/FANOTIFY_ACCESS_PERMISSIONS) \
    $(wildcard include/config/READ_ONLY_THP_FOR_FS) \
    $(wildcard include/config/FS_POSIX_ACL) \
    $(wildcard include/config/CGROUP_WRITEBACK) \
    $(wildcard include/config/IMA) \
    $(wildcard include/config/FILE_LOCKING) \
    $(wildcard include/config/FSNOTIFY) \
    $(wildcard include/config/EPOLL) \
    $(wildcard include/config/FS_DAX) \
    $(wildcard include/config/BLOCK) \
    $(wildcard include/config/UNICODE) \
  /root/linux/include/linux/fs/super.h \
  /root/linux/include/linux/fs/super_types.h \
    $(wildcard include/config/QUOTA) \
    $(wildcard include/config/FS_ENCRYPTION) \
    $(wildcard include/config/FS_VERITY) \
  /root/linux/include/linux/fs_dirent.h \
  /root/linux/include/linux/errseq.h \
  /root/linux/include/linux/list_lru.h \
  /root/linux/include/linux/shrinker.h \
    $(wildcard include/config/SHRINKER_DEBUG) \
  /root/linux/include/linux/xarray.h \
    $(wildcard include/config/XARRAY_MULTI) \
  /root/linux/include/linux/sched/mm.h \
    $(wildcard include/config/MMU_LAZY_TLB_REFCOUNT) \
    $(wildcard include/config/ARCH_HAS_MEMBARRIER_CALLBACKS) \
    $(wildcard include/config/ARCH_HAS_SYNC_CORE_BEFORE_USERMODE) \
  /root/linux/include/linux/sync_core.h \
    $(wildcard include/config/ARCH_HAS_PREPARE_SYNC_CORE_CMD) \
  /root/linux/arch/x86/include/asm/sync_core.h \
  /root/linux/include/linux/sched/coredump.h \
  /root/linux/include/linux/list_bl.h \
  /root/linux/include/linux/bit_spinlock.h \
  /root/linux/include/linux/uuid.h \
  /root/linux/include/linux/percpu-rwsem.h \
  /root/linux/include/linux/rcuwait.h \
  /root/linux/include/linux/sched/signal.h \
    $(wildcard include/config/SCHED_AUTOGROUP) \
    $(wildcard include/config/BSD_PROCESS_ACCT) \
    $(wildcard include/config/TASKSTATS) \
    $(wildcard include/config/STACK_GROWSUP) \
  /root/linux/include/linux/rculist.h \
    $(wildcard include/config/PROVE_RCU_LIST) \
  /root/linux/include/linux/signal.h \
    $(wildcard include/config/DYNAMIC_SIGFRAME) \
  /root/linux/include/linux/sched/jobctl.h \
  /root/linux/include/linux/sched/task.h \
    $(wildcard include/config/HAVE_EXIT_THREAD) \
    $(wildcard include/config/ARCH_WANTS_DYNAMIC_TASK_STRUCT) \
    $(wildcard include/config/HAVE_ARCH_THREAD_STRUCT_WHITELIST) \
  /root/linux/include/linux/uaccess.h \
    $(wildcard include/config/ARCH_HAS_SUBPAGE_FAULTS) \
  /root/linux/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/FAULT_INJECTION_USERCOPY) \
  /root/linux/include/linux/nospec.h \
  /root/linux/arch/x86/include/asm/uaccess.h \
    $(wildcard include/config/CC_HAS_ASM_GOTO_OUTPUT) \
    $(wildcard include/config/CC_HAS_ASM_GOTO_TIED_OUTPUT) \
    $(wildcard include/config/X86_INTEL_USERCOPY) \
  /root/linux/include/linux/mmap_lock.h \
  /root/linux/arch/x86/include/asm/smap.h \
  /root/linux/arch/x86/include/asm/extable.h \
    $(wildcard include/config/BPF_JIT) \
  /root/linux/arch/x86/include/asm/tlbflush.h \
  /root/linux/include/linux/mmu_notifier.h \
  /root/linux/include/linux/interval_tree.h \
  /root/linux/arch/x86/include/asm/invpcid.h \
  /root/linux/arch/x86/include/asm/pti.h \
  /root/linux/arch/x86/include/asm/pgtable.h \
    $(wildcard include/config/DEBUG_WX) \
    $(wildcard include/config/HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) \
    $(wildcard include/config/ARCH_SUPPORTS_PMD_PFNMAP) \
    $(wildcard include/config/ARCH_SUPPORTS_PUD_PFNMAP) \
    $(wildcard include/config/HAVE_ARCH_SOFT_DIRTY) \
    $(wildcard include/config/ARCH_ENABLE_THP_MIGRATION) \
    $(wildcard include/config/PAGE_TABLE_CHECK) \
    $(wildcard include/config/X86_SGX) \
  /root/linux/arch/x86/include/asm/pkru.h \
  /root/linux/arch/x86/include/asm/fpu/api.h \
    $(wildcard include/config/MATH_EMULATION) \
  /root/linux/arch/x86/include/asm/coco.h \
  /root/linux/include/asm-generic/pgtable_uffd.h \
    $(wildcard include/config/PTE_MARKER_UFFD_WP) \
  /root/linux/include/linux/page_table_check.h \
  /root/linux/arch/x86/include/asm/pgtable_64.h \
  /root/linux/arch/x86/include/asm/fixmap.h \
    $(wildcard include/config/PROVIDE_OHCI1394_DMA_INIT) \
    $(wildcard include/config/X86_IO_APIC) \
    $(wildcard include/config/PCI_MMCONFIG) \
    $(wildcard include/config/ACPI_APEI_GHES) \
    $(wildcard include/config/INTEL_TXT) \
  /root/linux/arch/x86/include/uapi/asm/vsyscall.h \
  /root/linux/include/asm-generic/fixmap.h \
  /root/linux/arch/x86/include/asm/pgtable-invert.h \
  /root/linux/arch/x86/include/asm/uaccess_64.h \
  /root/linux/include/asm-generic/access_ok.h \
    $(wildcard include/config/ALTERNATE_USER_ADDRESS_SPACE) \
  /root/linux/include/linux/cred.h \
  /root/linux/include/linux/capability.h \
  /root/linux/include/uapi/linux/capability.h \
  /root/linux/include/linux/key.h \
    $(wildcard include/config/KEY_NOTIFICATIONS) \
    $(wildcard include/config/NET) \
  /root/linux/include/linux/assoc_array.h \
    $(wildcard include/config/ASSOCIATIVE_ARRAY) \
  /root/linux/include/linux/sched/user.h \
    $(wildcard include/config/VFIO_PCI_ZDEV_KVM) \
    $(wildcard include/config/IOMMUFD) \
    $(wildcard include/config/WATCH_QUEUE) \
  /root/linux/include/linux/ratelimit.h \
  /root/linux/include/linux/pid.h \
  /root/linux/include/linux/posix-timers.h \
  /root/linux/include/linux/alarmtimer.h \
    $(wildcard include/config/RTC_CLASS) \
  /root/linux/include/linux/hrtimer.h \
    $(wildcard include/config/HIGH_RES_TIMERS) \
    $(wildcard include/config/TIME_LOW_RES) \
    $(wildcard include/config/TIMERFD) \
  /root/linux/include/linux/hrtimer_defs.h \
  /root/linux/include/linux/timerqueue.h \
  /root/linux/include/linux/rcuref.h \
  /root/linux/include/linux/rcu_sync.h \
  /root/linux/include/linux/quota.h \
    $(wildcard include/config/QUOTA_NETLINK_INTERFACE) \
  /root/linux/include/uapi/linux/dqblk_xfs.h \
  /root/linux/include/linux/dqblk_v1.h \
  /root/linux/include/linux/dqblk_v2.h \
  /root/linux/include/linux/dqblk_qtree.h \
  /root/linux/include/linux/projid.h \
  /root/linux/include/uapi/linux/quota.h \
  /root/linux/include/linux/unicode.h \
  /root/linux/include/linux/dcache.h \
  /root/linux/include/linux/rculist_bl.h \
  /root/linux/include/linux/lockref.h \
    $(wildcard include/config/ARCH_USE_CMPXCHG_LOCKREF) \
  /root/linux/include/linux/stringhash.h \
    $(wildcard include/config/DCACHE_WORD_ACCESS) \
  /root/linux/include/linux/hash.h \
    $(wildcard include/config/HAVE_ARCH_HASH) \
  /root/linux/include/linux/vfsdebug.h \
    $(wildcard include/config/DEBUG_VFS) \
  /root/linux/include/linux/wait_bit.h \
  /root/linux/include/linux/kdev_t.h \
  /root/linux/include/uapi/linux/kdev_t.h \
  /root/linux/include/linux/path.h \
  /root/linux/include/linux/radix-tree.h \
  /root/linux/include/linux/semaphore.h \
  /root/linux/include/linux/fcntl.h \
    $(wildcard include/config/ARCH_32BIT_OFF_T) \
  /root/linux/include/uapi/linux/fcntl.h \
  /root/linux/arch/x86/include/generated/uapi/asm/fcntl.h \
  /root/linux/include/uapi/asm-generic/fcntl.h \
  /root/linux/include/uapi/linux/openat2.h \
  /root/linux/include/linux/migrate_mode.h \
  /root/linux/include/linux/delayed_call.h \
  /root/linux/include/linux/ioprio.h \
  /root/linux/include/linux/sched/rt.h \
  /root/linux/include/linux/iocontext.h \
    $(wildcard include/config/BLK_ICQ) \
  /root/linux/include/uapi/linux/ioprio.h \
  /root/linux/include/linux/mount.h \
  /root/linux/include/linux/mnt_idmapping.h \
  /root/linux/include/linux/slab.h \
    $(wildcard include/config/FAILSLAB) \
    $(wildcard include/config/KFENCE) \
    $(wildcard include/config/SLUB_TINY) \
    $(wildcard include/config/SLUB_DEBUG) \
    $(wildcard include/config/SLAB_BUCKETS) \
    $(wildcard include/config/KVFREE_RCU_BATCHED) \
  /root/linux/include/linux/percpu-refcount.h \
  /root/linux/include/linux/kasan.h \
    $(wildcard include/config/KASAN_STACK) \
    $(wildcard include/config/KASAN_VMALLOC) \
  /root/linux/include/linux/kasan-enabled.h \
    $(wildcard include/config/ARCH_DEFER_KASAN) \
  /root/linux/include/linux/kasan-tags.h \
  /root/linux/include/linux/rw_hint.h \
  /root/linux/include/linux/file_ref.h \
  /root/linux/include/uapi/linux/fs.h \
  /root/linux/include/uapi/linux/aio_abi.h \
  /root/linux/include/uapi/linux/unistd.h \
  /root/linux/arch/x86/include/asm/unistd.h \
  /root/linux/arch/x86/include/uapi/asm/unistd.h \
  /root/linux/arch/x86/include/generated/uapi/asm/unistd_64.h \
  /root/linux/arch/x86/include/generated/asm/unistd_64_x32.h \
  /root/linux/arch/x86/include/generated/asm/unistd_32_ia32.h \
  /root/linux/arch/x86/include/asm/compat.h \
  /root/linux/include/linux/sched/task_stack.h \
    $(wildcard include/config/DEBUG_STACK_USAGE) \
  /root/linux/include/uapi/linux/magic.h \
  /root/linux/arch/x86/include/asm/user32.h \
  /root/linux/include/asm-generic/compat.h \
    $(wildcard include/config/COMPAT_FOR_U64_ALIGNMENT) \
  /root/linux/arch/x86/include/asm/syscall_wrapper.h \
  /root/linux/arch/x86/include/asm/user.h \
  /root/linux/arch/x86/include/asm/user_64.h \
  /root/linux/arch/x86/include/asm/fsgsbase.h \
  /root/linux/arch/x86/include/asm/vdso.h \
  /root/linux/include/uapi/linux/elf.h \
  /root/linux/include/uapi/linux/elf-em.h \
  /root/linux/include/linux/kobject.h \
    $(wildcard include/config/UEVENT_HELPER) \
    $(wildcard include/config/DEBUG_KOBJECT_RELEASE) \
  /root/linux/include/linux/sysfs.h \
  /root/linux/include/linux/kernfs.h \
    $(wildcard include/config/KERNFS) \
  /root/linux/include/linux/idr.h \
  /root/linux/include/linux/kobject_ns.h \
  /root/linux/include/linux/moduleparam.h \
    $(wildcard include/config/ALPHA) \
    $(wildcard include/config/PPC64) \
  /root/linux/include/linux/rbtree_latch.h \
  /root/linux/include/linux/error-injection.h \
  /root/linux/include/asm-generic/error-injection.h \
  /root/linux/include/linux/dynamic_debug.h \
  /root/linux/arch/x86/include/asm/module.h \
    $(wildcard include/config/UNWINDER_ORC) \
  /root/linux/include/asm-generic/module.h \
    $(wildcard include/config/HAVE_MOD_ARCH_SPECIFIC) \
  /root/linux/include/linux/export-internal.h \
    $(wildcard include/config/PARISC) \

device.mod.o: $(deps_device.mod.o)

$(deps_device.mod.o):

device.mod.o: $(wildcard /root/linux/tools/objtool/objtool)
