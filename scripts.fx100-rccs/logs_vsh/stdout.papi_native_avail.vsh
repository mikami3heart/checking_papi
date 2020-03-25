Available native events and hardware information.
--------------------------------------------------------------------------------
PAPI Version             : 5.3.0.0
Vendor string and code   : GenuineIntel (1)
Model string and code    : Intel(R) Xeon(R) CPU E5-2670 0 @ 2.60GHz (45)
CPU Revision             : 7.000000
CPUID Info               : Family: 6  Model: 45  Stepping: 7
CPU Max Megahertz        : 2599
CPU Min Megahertz        : 2599
Hdw Threads per core     : 1
Cores per Socket         : 8
Sockets                  : 2
NUMA Nodes               : 2
CPUs per Node            : 8
Total CPUs               : 16
Running in a VM          : no
Number Hardware Counters : 11
Max Multiplex Counters   : 32
--------------------------------------------------------------------------------

===============================================================================
 Native Events in Component: perf_event
===============================================================================
| ix86arch::UNHALTED_CORE_CYCLES                                               |
|            count core clock cycles whenever the clock signal on the specific |
|            core is running (not halted)                                      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ix86arch::INSTRUCTION_RETIRED                                                |
|            count the number of instructions at retirement. For instructions t|
|            hat consists of multiple micro-ops, this event counts the retireme|
|            nt of the last micro-op of the instruction                        |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ix86arch::UNHALTED_REFERENCE_CYCLES                                          |
|            count reference clock cycles while the clock signal on the specifi|
|            c core is running. The reference clock operates at a fixed frequen|
|            cy, irrespective of core freqeuncy changes due to performance stat|
|            e transitions                                                     |
--------------------------------------------------------------------------------
| ix86arch::LLC_REFERENCES                                                     |
|            count each request originating from the core to reference a cache |
|            line in the last level cache. The count may include speculation, b|
|            ut excludes cache line fills due to hardware prefetch             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ix86arch::LLC_MISSES                                                         |
|            count each cache miss condition for references to the last level c|
|            ache. The event count may include speculation, but excludes cache |
|            line fills due to hardware prefetch                               |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ix86arch::BRANCH_INSTRUCTIONS_RETIRED                                        |
|            count branch instructions at retirement. Specifically, this event |
|            counts the retirement of the last micro-op of a branch instruction|
|                                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ix86arch::MISPREDICTED_BRANCH_RETIRED                                        |
|            count mispredicted branch instructions at retirement. Specifically|
|            , this event counts at retirement of the last micro-op of a branch|
|             instruction in the architectural path of the execution and experi|
|            enced misprediction in the branch prediction hardware             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CPU_CYCLES                                               |
|            PERF_COUNT_HW_CPU_CYCLES                                          |
--------------------------------------------------------------------------------
| perf::CYCLES                                                                 |
|            PERF_COUNT_HW_CPU_CYCLES                                          |
--------------------------------------------------------------------------------
| perf::CPU-CYCLES                                                             |
|            PERF_COUNT_HW_CPU_CYCLES                                          |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_INSTRUCTIONS                                             |
|            PERF_COUNT_HW_INSTRUCTIONS                                        |
--------------------------------------------------------------------------------
| perf::INSTRUCTIONS                                                           |
|            PERF_COUNT_HW_INSTRUCTIONS                                        |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_REFERENCES                                         |
|            PERF_COUNT_HW_CACHE_REFERENCES                                    |
--------------------------------------------------------------------------------
| perf::CACHE-REFERENCES                                                       |
|            PERF_COUNT_HW_CACHE_REFERENCES                                    |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_MISSES                                             |
|            PERF_COUNT_HW_CACHE_MISSES                                        |
--------------------------------------------------------------------------------
| perf::CACHE-MISSES                                                           |
|            PERF_COUNT_HW_CACHE_MISSES                                        |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_BRANCH_INSTRUCTIONS                                      |
|            PERF_COUNT_HW_BRANCH_INSTRUCTIONS                                 |
--------------------------------------------------------------------------------
| perf::BRANCH-INSTRUCTIONS                                                    |
|            PERF_COUNT_HW_BRANCH_INSTRUCTIONS                                 |
--------------------------------------------------------------------------------
| perf::BRANCHES                                                               |
|            PERF_COUNT_HW_BRANCH_INSTRUCTIONS                                 |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_BRANCH_MISSES                                            |
|            PERF_COUNT_HW_BRANCH_MISSES                                       |
--------------------------------------------------------------------------------
| perf::BRANCH-MISSES                                                          |
|            PERF_COUNT_HW_BRANCH_MISSES                                       |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_BUS_CYCLES                                               |
|            PERF_COUNT_HW_BUS_CYCLES                                          |
--------------------------------------------------------------------------------
| perf::BUS-CYCLES                                                             |
|            PERF_COUNT_HW_BUS_CYCLES                                          |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_STALLED_CYCLES_FRONTEND                                  |
|            PERF_COUNT_HW_STALLED_CYCLES_FRONTEND                             |
--------------------------------------------------------------------------------
| perf::STALLED-CYCLES-FRONTEND                                                |
|            PERF_COUNT_HW_STALLED_CYCLES_FRONTEND                             |
--------------------------------------------------------------------------------
| perf::IDLE-CYCLES-FRONTEND                                                   |
|            PERF_COUNT_HW_STALLED_CYCLES_FRONTEND                             |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_STALLED_CYCLES_BACKEND                                   |
|            PERF_COUNT_HW_STALLED_CYCLES_BACKEND                              |
--------------------------------------------------------------------------------
| perf::STALLED-CYCLES-BACKEND                                                 |
|            PERF_COUNT_HW_STALLED_CYCLES_BACKEND                              |
--------------------------------------------------------------------------------
| perf::IDLE-CYCLES-BACKEND                                                    |
|            PERF_COUNT_HW_STALLED_CYCLES_BACKEND                              |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_REF_CPU_CYCLES                                           |
|            PERF_COUNT_HW_REF_CPU_CYCLES                                      |
--------------------------------------------------------------------------------
| perf::REF-CYCLES                                                             |
|            PERF_COUNT_HW_REF_CPU_CYCLES                                      |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_CPU_CLOCK                                                |
|            PERF_COUNT_SW_CPU_CLOCK                                           |
--------------------------------------------------------------------------------
| perf::CPU-CLOCK                                                              |
|            PERF_COUNT_SW_CPU_CLOCK                                           |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_TASK_CLOCK                                               |
|            PERF_COUNT_SW_TASK_CLOCK                                          |
--------------------------------------------------------------------------------
| perf::TASK-CLOCK                                                             |
|            PERF_COUNT_SW_TASK_CLOCK                                          |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_PAGE_FAULTS                                              |
|            PERF_COUNT_SW_PAGE_FAULTS                                         |
--------------------------------------------------------------------------------
| perf::PAGE-FAULTS                                                            |
|            PERF_COUNT_SW_PAGE_FAULTS                                         |
--------------------------------------------------------------------------------
| perf::FAULTS                                                                 |
|            PERF_COUNT_SW_PAGE_FAULTS                                         |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_CONTEXT_SWITCHES                                         |
|            PERF_COUNT_SW_CONTEXT_SWITCHES                                    |
--------------------------------------------------------------------------------
| perf::CONTEXT-SWITCHES                                                       |
|            PERF_COUNT_SW_CONTEXT_SWITCHES                                    |
--------------------------------------------------------------------------------
| perf::CS                                                                     |
|            PERF_COUNT_SW_CONTEXT_SWITCHES                                    |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_CPU_MIGRATIONS                                           |
|            PERF_COUNT_SW_CPU_MIGRATIONS                                      |
--------------------------------------------------------------------------------
| perf::CPU-MIGRATIONS                                                         |
|            PERF_COUNT_SW_CPU_MIGRATIONS                                      |
--------------------------------------------------------------------------------
| perf::MIGRATIONS                                                             |
|            PERF_COUNT_SW_CPU_MIGRATIONS                                      |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_PAGE_FAULTS_MIN                                          |
|            PERF_COUNT_SW_PAGE_FAULTS_MIN                                     |
--------------------------------------------------------------------------------
| perf::MINOR-FAULTS                                                           |
|            PERF_COUNT_SW_PAGE_FAULTS_MIN                                     |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_SW_PAGE_FAULTS_MAJ                                          |
|            PERF_COUNT_SW_PAGE_FAULTS_MAJ                                     |
--------------------------------------------------------------------------------
| perf::MAJOR-FAULTS                                                           |
|            PERF_COUNT_SW_PAGE_FAULTS_MAJ                                     |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_L1D                                                |
|            L1 data cache                                                     |
|     :READ                                                                    |
|            read access                                                       |
|     :WRITE                                                                   |
|            write access                                                      |
|     :PREFETCH                                                                |
|            prefetch access                                                   |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-LOADS                                                        |
|            L1 cache load accesses                                            |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-LOAD-MISSES                                                  |
|            L1 cache load misses                                              |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-STORES                                                       |
|            L1 cache store accesses                                           |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-STORE-MISSES                                                 |
|            L1 cache store misses                                             |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-PREFETCHES                                                   |
|            L1 cache prefetch accesses                                        |
--------------------------------------------------------------------------------
| perf::L1-DCACHE-PREFETCH-MISSES                                              |
|            L1 cache prefetch misses                                          |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_L1I                                                |
|            L1 instruction cache                                              |
|     :READ                                                                    |
|            read access                                                       |
|     :PREFETCH                                                                |
|            prefetch access                                                   |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::L1-ICACHE-LOADS                                                        |
|            L1I cache load accesses                                           |
--------------------------------------------------------------------------------
| perf::L1-ICACHE-LOAD-MISSES                                                  |
|            L1I cache load misses                                             |
--------------------------------------------------------------------------------
| perf::L1-ICACHE-PREFETCHES                                                   |
|            L1I cache prefetch accesses                                       |
--------------------------------------------------------------------------------
| perf::L1-ICACHE-PREFETCH-MISSES                                              |
|            L1I cache prefetch misses                                         |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_LL                                                 |
|            Last level cache                                                  |
|     :READ                                                                    |
|            read access                                                       |
|     :WRITE                                                                   |
|            write access                                                      |
|     :PREFETCH                                                                |
|            prefetch access                                                   |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::LLC-LOADS                                                              |
|            Last level cache load accesses                                    |
--------------------------------------------------------------------------------
| perf::LLC-LOAD-MISSES                                                        |
|            Last level cache load misses                                      |
--------------------------------------------------------------------------------
| perf::LLC-STORES                                                             |
|            Last level cache store accesses                                   |
--------------------------------------------------------------------------------
| perf::LLC-STORE-MISSES                                                       |
|            Last level cache store misses                                     |
--------------------------------------------------------------------------------
| perf::LLC-PREFETCHES                                                         |
|            Last level cache prefetch accesses                                |
--------------------------------------------------------------------------------
| perf::LLC-PREFETCH-MISSES                                                    |
|            Last level cache prefetch misses                                  |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_DTLB                                               |
|            Data Translation Lookaside Buffer                                 |
|     :READ                                                                    |
|            read access                                                       |
|     :WRITE                                                                   |
|            write access                                                      |
|     :PREFETCH                                                                |
|            prefetch access                                                   |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::DTLB-LOADS                                                             |
|            Data TLB load accesses                                            |
--------------------------------------------------------------------------------
| perf::DTLB-LOAD-MISSES                                                       |
|            Data TLB load misses                                              |
--------------------------------------------------------------------------------
| perf::DTLB-STORES                                                            |
|            Data TLB store accesses                                           |
--------------------------------------------------------------------------------
| perf::DTLB-STORE-MISSES                                                      |
|            Data TLB store misses                                             |
--------------------------------------------------------------------------------
| perf::DTLB-PREFETCHES                                                        |
|            Data TLB prefetch accesses                                        |
--------------------------------------------------------------------------------
| perf::DTLB-PREFETCH-MISSES                                                   |
|            Data TLB prefetch misses                                          |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_ITLB                                               |
|            Instruction Translation Lookaside Buffer                          |
|     :READ                                                                    |
|            read access                                                       |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::ITLB-LOADS                                                             |
|            Instruction TLB load accesses                                     |
--------------------------------------------------------------------------------
| perf::ITLB-LOAD-MISSES                                                       |
|            Instruction TLB load misses                                       |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_BPU                                                |
|            Branch Prediction Unit                                            |
|     :READ                                                                    |
|            read access                                                       |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::BRANCH-LOADS                                                           |
|            Branch  load accesses                                             |
--------------------------------------------------------------------------------
| perf::BRANCH-LOAD-MISSES                                                     |
|            Branch  load misses                                               |
--------------------------------------------------------------------------------
| perf::PERF_COUNT_HW_CACHE_NODE                                               |
|            Node memory access                                                |
|     :READ                                                                    |
|            read access                                                       |
|     :WRITE                                                                   |
|            write access                                                      |
|     :PREFETCH                                                                |
|            prefetch access                                                   |
|     :ACCESS                                                                  |
|            hit access                                                        |
|     :MISS                                                                    |
|            miss access                                                       |
--------------------------------------------------------------------------------
| perf::NODE-LOADS                                                             |
|            Node  load accesses                                               |
--------------------------------------------------------------------------------
| perf::NODE-LOAD-MISSES                                                       |
|            Node  load misses                                                 |
--------------------------------------------------------------------------------
| perf::NODE-STORES                                                            |
|            Node  store accesses                                              |
--------------------------------------------------------------------------------
| perf::NODE-STORE-MISSES                                                      |
|            Node  store misses                                                |
--------------------------------------------------------------------------------
| perf::NODE-PREFETCHES                                                        |
|            Node  prefetch accesses                                           |
--------------------------------------------------------------------------------
| perf::NODE-PREFETCH-MISSES                                                   |
|            Node  prefetch misses                                             |
--------------------------------------------------------------------------------
| perf::sunrpc                                                                 |
|            tracepoint                                                        |
|     :rpc_call_status                                                         |
|            rpc_call_status                                                   |
|     :rpc_bind_status                                                         |
|            rpc_bind_status                                                   |
|     :rpc_connect_status                                                      |
|            rpc_connect_status                                                |
--------------------------------------------------------------------------------
| perf::drm                                                                    |
|            tracepoint                                                        |
|     :drm_vblank_event                                                        |
|            drm_vblank_event                                                  |
|     :drm_vblank_event_queued                                                 |
|            drm_vblank_event_queued                                           |
|     :drm_vblank_event_delivered                                              |
|            drm_vblank_event_delivered                                        |
--------------------------------------------------------------------------------
| perf::skb                                                                    |
|            tracepoint                                                        |
|     :kfree_skb                                                               |
|            kfree_skb                                                         |
|     :consume_skb                                                             |
|            consume_skb                                                       |
|     :skb_copy_datagram_iovec                                                 |
|            skb_copy_datagram_iovec                                           |
--------------------------------------------------------------------------------
| perf::net                                                                    |
|            tracepoint                                                        |
|     :net_dev_xmit                                                            |
|            net_dev_xmit                                                      |
|     :net_dev_queue                                                           |
|            net_dev_queue                                                     |
|     :netif_receive_skb                                                       |
|            netif_receive_skb                                                 |
|     :netif_rx                                                                |
|            netif_rx                                                          |
--------------------------------------------------------------------------------
| perf::napi                                                                   |
|            tracepoint                                                        |
|     :napi_poll                                                               |
|            napi_poll                                                         |
--------------------------------------------------------------------------------
| perf::scsi                                                                   |
|            tracepoint                                                        |
|     :scsi_dispatch_cmd_start                                                 |
|            scsi_dispatch_cmd_start                                           |
|     :scsi_dispatch_cmd_error                                                 |
|            scsi_dispatch_cmd_error                                           |
|     :scsi_dispatch_cmd_done                                                  |
|            scsi_dispatch_cmd_done                                            |
|     :scsi_dispatch_cmd_timeout                                               |
|            scsi_dispatch_cmd_timeout                                         |
|     :scsi_eh_wakeup                                                          |
|            scsi_eh_wakeup                                                    |
--------------------------------------------------------------------------------
| perf::block                                                                  |
|            tracepoint                                                        |
|     :block_rq_abort                                                          |
|            block_rq_abort                                                    |
|     :block_rq_requeue                                                        |
|            block_rq_requeue                                                  |
|     :block_rq_complete                                                       |
|            block_rq_complete                                                 |
|     :block_rq_insert                                                         |
|            block_rq_insert                                                   |
|     :block_rq_issue                                                          |
|            block_rq_issue                                                    |
|     :block_bio_bounce                                                        |
|            block_bio_bounce                                                  |
|     :block_bio_complete                                                      |
|            block_bio_complete                                                |
|     :block_bio_backmerge                                                     |
|            block_bio_backmerge                                               |
|     :block_bio_frontmerge                                                    |
|            block_bio_frontmerge                                              |
|     :block_bio_queue                                                         |
|            block_bio_queue                                                   |
|     :block_getrq                                                             |
|            block_getrq                                                       |
|     :block_sleeprq                                                           |
|            block_sleeprq                                                     |
|     :block_plug                                                              |
|            block_plug                                                        |
|     :block_unplug_timer                                                      |
|            block_unplug_timer                                                |
|     :block_unplug_io                                                         |
|            block_unplug_io                                                   |
|     :block_split                                                             |
|            block_split                                                       |
|     :block_remap                                                             |
|            block_remap                                                       |
|     :block_rq_remap                                                          |
|            block_rq_remap                                                    |
--------------------------------------------------------------------------------
| perf::writeback                                                              |
|            tracepoint                                                        |
|     :writeback_nothread                                                      |
|            writeback_nothread                                                |
|     :writeback_queue                                                         |
|            writeback_queue                                                   |
|     :writeback_exec                                                          |
|            writeback_exec                                                    |
|     :writeback_pages_written                                                 |
|            writeback_pages_written                                           |
|     :writeback_nowork                                                        |
|            writeback_nowork                                                  |
|     :writeback_bdi_register                                                  |
|            writeback_bdi_register                                            |
|     :writeback_bdi_unregister                                                |
|            writeback_bdi_unregister                                          |
|     :writeback_task_start                                                    |
|            writeback_task_start                                              |
|     :writeback_task_stop                                                     |
|            writeback_task_stop                                               |
|     :wbc_writeback_start                                                     |
|            wbc_writeback_start                                               |
|     :wbc_writeback_written                                                   |
|            wbc_writeback_written                                             |
|     :wbc_writeback_wait                                                      |
|            wbc_writeback_wait                                                |
|     :wbc_balance_dirty_start                                                 |
|            wbc_balance_dirty_start                                           |
|     :wbc_balance_dirty_written                                               |
|            wbc_balance_dirty_written                                         |
|     :wbc_balance_dirty_wait                                                  |
|            wbc_balance_dirty_wait                                            |
|     :wbc_writepage                                                           |
|            wbc_writepage                                                     |
--------------------------------------------------------------------------------
| perf::kmem                                                                   |
|            tracepoint                                                        |
|     :kmalloc                                                                 |
|            kmalloc                                                           |
|     :kmem_cache_alloc                                                        |
|            kmem_cache_alloc                                                  |
|     :kmalloc_node                                                            |
|            kmalloc_node                                                      |
|     :kmem_cache_alloc_node                                                   |
|            kmem_cache_alloc_node                                             |
|     :kfree                                                                   |
|            kfree                                                             |
|     :kmem_cache_free                                                         |
|            kmem_cache_free                                                   |
|     :mm_page_free_direct                                                     |
|            mm_page_free_direct                                               |
|     :mm_pagevec_free                                                         |
|            mm_pagevec_free                                                   |
|     :mm_page_alloc                                                           |
|            mm_page_alloc                                                     |
|     :mm_page_alloc_zone_locked                                               |
|            mm_page_alloc_zone_locked                                         |
|     :mm_page_pcpu_drain                                                      |
|            mm_page_pcpu_drain                                                |
|     :mm_page_alloc_extfrag                                                   |
|            mm_page_alloc_extfrag                                             |
|     :mm_anon_fault                                                           |
|            mm_anon_fault                                                     |
|     :mm_anon_pgin                                                            |
|            mm_anon_pgin                                                      |
|     :mm_anon_cow                                                             |
|            mm_anon_cow                                                       |
|     :mm_anon_userfree                                                        |
|            mm_anon_userfree                                                  |
|     :mm_anon_unmap                                                           |
|            mm_anon_unmap                                                     |
|     :mm_filemap_fault                                                        |
|            mm_filemap_fault                                                  |
|     :mm_filemap_cow                                                          |
|            mm_filemap_cow                                                    |
|     :mm_filemap_unmap                                                        |
|            mm_filemap_unmap                                                  |
|     :mm_filemap_userunmap                                                    |
|            mm_filemap_userunmap                                              |
|     :mm_pagereclaim_pgout                                                    |
|            mm_pagereclaim_pgout                                              |
|     :mm_pagereclaim_free                                                     |
|            mm_pagereclaim_free                                               |
|     :mm_background_writeout                                                  |
|            mm_background_writeout                                            |
|     :mm_olddata_writeout                                                     |
|            mm_olddata_writeout                                               |
|     :mm_balancedirty_writeout                                                |
|            mm_balancedirty_writeout                                          |
|     :mm_kswapd_ran                                                           |
|            mm_kswapd_ran                                                     |
|     :mm_directreclaim_reclaimall                                             |
|            mm_directreclaim_reclaimall                                       |
|     :mm_directreclaim_reclaimzone                                            |
|            mm_directreclaim_reclaimzone                                      |
|     :mm_pagereclaim_shrinkzone                                               |
|            mm_pagereclaim_shrinkzone                                         |
|     :mm_pagereclaim_shrinkactive                                             |
|            mm_pagereclaim_shrinkactive                                       |
|     :mm_pagereclaim_shrinkinactive                                           |
|            mm_pagereclaim_shrinkinactive                                     |
|     :mm_kernel_pagefault                                                     |
|            mm_kernel_pagefault                                               |
|     :mm_vmscan_kswapd_sleep                                                  |
|            mm_vmscan_kswapd_sleep                                            |
|     :mm_vmscan_kswapd_wake                                                   |
|            mm_vmscan_kswapd_wake                                             |
|     :mm_vmscan_wakeup_kswapd                                                 |
|            mm_vmscan_wakeup_kswapd                                           |
|     :mm_vmscan_direct_reclaim_begin                                          |
|            mm_vmscan_direct_reclaim_begin                                    |
|     :mm_vmscan_direct_reclaim_end                                            |
|            mm_vmscan_direct_reclaim_end                                      |
|     :mm_vmscan_lru_isolate                                                   |
|            mm_vmscan_lru_isolate                                             |
|     :mm_vmscan_writepage                                                     |
|            mm_vmscan_writepage                                               |
--------------------------------------------------------------------------------
| perf::power                                                                  |
|            tracepoint                                                        |
|     :power_start                                                             |
|            power_start                                                       |
|     :power_frequency                                                         |
|            power_frequency                                                   |
|     :power_end                                                               |
|            power_end                                                         |
--------------------------------------------------------------------------------
| perf::module                                                                 |
|            tracepoint                                                        |
|     :module_load                                                             |
|            module_load                                                       |
|     :module_free                                                             |
|            module_free                                                       |
|     :module_get                                                              |
|            module_get                                                        |
|     :module_put                                                              |
|            module_put                                                        |
|     :module_request                                                          |
|            module_request                                                    |
--------------------------------------------------------------------------------
| perf::workqueue                                                              |
|            tracepoint                                                        |
|     :workqueue_insertion                                                     |
|            workqueue_insertion                                               |
|     :workqueue_execution                                                     |
|            workqueue_execution                                               |
|     :workqueue_creation                                                      |
|            workqueue_creation                                                |
|     :workqueue_destruction                                                   |
|            workqueue_destruction                                             |
--------------------------------------------------------------------------------
| perf::signal                                                                 |
|            tracepoint                                                        |
|     :signal_generate                                                         |
|            signal_generate                                                   |
|     :signal_deliver                                                          |
|            signal_deliver                                                    |
|     :signal_overflow_fail                                                    |
|            signal_overflow_fail                                              |
|     :signal_lose_info                                                        |
|            signal_lose_info                                                  |
--------------------------------------------------------------------------------
| perf::timer                                                                  |
|            tracepoint                                                        |
|     :timer_init                                                              |
|            timer_init                                                        |
|     :timer_start                                                             |
|            timer_start                                                       |
|     :timer_expire_entry                                                      |
|            timer_expire_entry                                                |
|     :timer_expire_exit                                                       |
|            timer_expire_exit                                                 |
|     :timer_cancel                                                            |
|            timer_cancel                                                      |
|     :hrtimer_init                                                            |
|            hrtimer_init                                                      |
|     :hrtimer_start                                                           |
|            hrtimer_start                                                     |
|     :hrtimer_expire_entry                                                    |
|            hrtimer_expire_entry                                              |
|     :hrtimer_expire_exit                                                     |
|            hrtimer_expire_exit                                               |
|     :hrtimer_cancel                                                          |
|            hrtimer_cancel                                                    |
|     :itimer_state                                                            |
|            itimer_state                                                      |
|     :itimer_expire                                                           |
|            itimer_expire                                                     |
--------------------------------------------------------------------------------
| perf::irq                                                                    |
|            tracepoint                                                        |
|     :irq_handler_entry                                                       |
|            irq_handler_entry                                                 |
|     :irq_handler_exit                                                        |
|            irq_handler_exit                                                  |
|     :softirq_entry                                                           |
|            softirq_entry                                                     |
|     :softirq_exit                                                            |
|            softirq_exit                                                      |
|     :softirq_raise                                                           |
|            softirq_raise                                                     |
--------------------------------------------------------------------------------
| perf::sched                                                                  |
|            tracepoint                                                        |
|     :sched_kthread_stop                                                      |
|            sched_kthread_stop                                                |
|     :sched_kthread_stop_ret                                                  |
|            sched_kthread_stop_ret                                            |
|     :sched_wait_task                                                         |
|            sched_wait_task                                                   |
|     :sched_wakeup                                                            |
|            sched_wakeup                                                      |
|     :sched_wakeup_new                                                        |
|            sched_wakeup_new                                                  |
|     :sched_switch                                                            |
|            sched_switch                                                      |
|     :sched_migrate_task                                                      |
|            sched_migrate_task                                                |
|     :sched_process_free                                                      |
|            sched_process_free                                                |
|     :sched_process_exit                                                      |
|            sched_process_exit                                                |
|     :sched_process_wait                                                      |
|            sched_process_wait                                                |
|     :sched_process_fork                                                      |
|            sched_process_fork                                                |
|     :sched_stat_wait                                                         |
|            sched_stat_wait                                                   |
|     :sched_stat_sleep                                                        |
|            sched_stat_sleep                                                  |
|     :sched_stat_iowait                                                       |
|            sched_stat_iowait                                                 |
|     :sched_stat_runtime                                                      |
|            sched_stat_runtime                                                |
--------------------------------------------------------------------------------
| perf::mce                                                                    |
|            tracepoint                                                        |
|     :mce_record                                                              |
|            mce_record                                                        |
--------------------------------------------------------------------------------
| perf::syscalls                                                               |
|            tracepoint                                                        |
|     :sys_enter_socket                                                        |
|            sys_enter_socket                                                  |
|     :sys_exit_socket                                                         |
|            sys_exit_socket                                                   |
|     :sys_enter_socketpair                                                    |
|            sys_enter_socketpair                                              |
|     :sys_exit_socketpair                                                     |
|            sys_exit_socketpair                                               |
|     :sys_enter_bind                                                          |
|            sys_enter_bind                                                    |
|     :sys_exit_bind                                                           |
|            sys_exit_bind                                                     |
|     :sys_enter_listen                                                        |
|            sys_enter_listen                                                  |
|     :sys_exit_listen                                                         |
|            sys_exit_listen                                                   |
|     :sys_enter_accept4                                                       |
|            sys_enter_accept4                                                 |
|     :sys_exit_accept4                                                        |
|            sys_exit_accept4                                                  |
|     :sys_enter_accept                                                        |
|            sys_enter_accept                                                  |
|     :sys_exit_accept                                                         |
|            sys_exit_accept                                                   |
|     :sys_enter_connect                                                       |
|            sys_enter_connect                                                 |
|     :sys_exit_connect                                                        |
|            sys_exit_connect                                                  |
|     :sys_enter_getsockname                                                   |
|            sys_enter_getsockname                                             |
|     :sys_exit_getsockname                                                    |
|            sys_exit_getsockname                                              |
|     :sys_enter_getpeername                                                   |
|            sys_enter_getpeername                                             |
|     :sys_exit_getpeername                                                    |
|            sys_exit_getpeername                                              |
|     :sys_enter_sendto                                                        |
|            sys_enter_sendto                                                  |
|     :sys_exit_sendto                                                         |
|            sys_exit_sendto                                                   |
|     :sys_enter_recvfrom                                                      |
|            sys_enter_recvfrom                                                |
|     :sys_exit_recvfrom                                                       |
|            sys_exit_recvfrom                                                 |
|     :sys_enter_setsockopt                                                    |
|            sys_enter_setsockopt                                              |
|     :sys_exit_setsockopt                                                     |
|            sys_exit_setsockopt                                               |
|     :sys_enter_getsockopt                                                    |
|            sys_enter_getsockopt                                              |
|     :sys_exit_getsockopt                                                     |
|            sys_exit_getsockopt                                               |
|     :sys_enter_shutdown                                                      |
|            sys_enter_shutdown                                                |
|     :sys_exit_shutdown                                                       |
|            sys_exit_shutdown                                                 |
|     :sys_enter_sendmsg                                                       |
|            sys_enter_sendmsg                                                 |
|     :sys_exit_sendmsg                                                        |
|            sys_exit_sendmsg                                                  |
|     :sys_enter_recvmsg                                                       |
|            sys_enter_recvmsg                                                 |
|     :sys_exit_recvmsg                                                        |
|            sys_exit_recvmsg                                                  |
|     :sys_enter_recvmmsg                                                      |
|            sys_enter_recvmmsg                                                |
|     :sys_exit_recvmmsg                                                       |
|            sys_exit_recvmmsg                                                 |
|     :sys_enter_add_key                                                       |
|            sys_enter_add_key                                                 |
|     :sys_exit_add_key                                                        |
|            sys_exit_add_key                                                  |
|     :sys_enter_request_key                                                   |
|            sys_enter_request_key                                             |
|     :sys_exit_request_key                                                    |
|            sys_exit_request_key                                              |
|     :sys_enter_keyctl                                                        |
|            sys_enter_keyctl                                                  |
|     :sys_exit_keyctl                                                         |
|            sys_exit_keyctl                                                   |
|     :sys_enter_mq_open                                                       |
|            sys_enter_mq_open                                                 |
|     :sys_exit_mq_open                                                        |
|            sys_exit_mq_open                                                  |
|     :sys_enter_mq_unlink                                                     |
|            sys_enter_mq_unlink                                               |
|     :sys_exit_mq_unlink                                                      |
|            sys_exit_mq_unlink                                                |
|     :sys_enter_mq_timedsend                                                  |
|            sys_enter_mq_timedsend                                            |
|     :sys_exit_mq_timedsend                                                   |
|            sys_exit_mq_timedsend                                             |
|     :sys_enter_mq_timedreceive                                               |
|            sys_enter_mq_timedreceive                                         |
|     :sys_exit_mq_timedreceive                                                |
|            sys_exit_mq_timedreceive                                          |
|     :sys_enter_mq_notify                                                     |
|            sys_enter_mq_notify                                               |
|     :sys_exit_mq_notify                                                      |
|            sys_exit_mq_notify                                                |
|     :sys_enter_mq_getsetattr                                                 |
|            sys_enter_mq_getsetattr                                           |
|     :sys_exit_mq_getsetattr                                                  |
|            sys_exit_mq_getsetattr                                            |
|     :sys_enter_shmget                                                        |
|            sys_enter_shmget                                                  |
|     :sys_exit_shmget                                                         |
|            sys_exit_shmget                                                   |
|     :sys_enter_shmctl                                                        |
|            sys_enter_shmctl                                                  |
|     :sys_exit_shmctl                                                         |
|            sys_exit_shmctl                                                   |
|     :sys_enter_shmat                                                         |
|            sys_enter_shmat                                                   |
|     :sys_exit_shmat                                                          |
|            sys_exit_shmat                                                    |
|     :sys_enter_shmdt                                                         |
|            sys_enter_shmdt                                                   |
|     :sys_exit_shmdt                                                          |
|            sys_exit_shmdt                                                    |
|     :sys_enter_semget                                                        |
|            sys_enter_semget                                                  |
|     :sys_exit_semget                                                         |
|            sys_exit_semget                                                   |
|     :sys_enter_semtimedop                                                    |
|            sys_enter_semtimedop                                              |
|     :sys_exit_semtimedop                                                     |
|            sys_exit_semtimedop                                               |
|     :sys_enter_semop                                                         |
|            sys_enter_semop                                                   |
|     :sys_exit_semop                                                          |
|            sys_exit_semop                                                    |
|     :sys_enter_msgget                                                        |
|            sys_enter_msgget                                                  |
|     :sys_exit_msgget                                                         |
|            sys_exit_msgget                                                   |
|     :sys_enter_msgctl                                                        |
|            sys_enter_msgctl                                                  |
|     :sys_exit_msgctl                                                         |
|            sys_exit_msgctl                                                   |
|     :sys_enter_msgsnd                                                        |
|            sys_enter_msgsnd                                                  |
|     :sys_exit_msgsnd                                                         |
|            sys_exit_msgsnd                                                   |
|     :sys_enter_msgrcv                                                        |
|            sys_enter_msgrcv                                                  |
|     :sys_exit_msgrcv                                                         |
|            sys_exit_msgrcv                                                   |
|     :sys_enter_quotactl                                                      |
|            sys_enter_quotactl                                                |
|     :sys_exit_quotactl                                                       |
|            sys_exit_quotactl                                                 |
|     :sys_enter_nfsservctl                                                    |
|            sys_enter_nfsservctl                                              |
|     :sys_exit_nfsservctl                                                     |
|            sys_exit_nfsservctl                                               |
|     :sys_enter_flock                                                         |
|            sys_enter_flock                                                   |
|     :sys_exit_flock                                                          |
|            sys_exit_flock                                                    |
|     :sys_enter_io_setup                                                      |
|            sys_enter_io_setup                                                |
|     :sys_exit_io_setup                                                       |
|            sys_exit_io_setup                                                 |
|     :sys_enter_io_destroy                                                    |
|            sys_enter_io_destroy                                              |
|     :sys_exit_io_destroy                                                     |
|            sys_exit_io_destroy                                               |
|     :sys_enter_io_submit                                                     |
|            sys_enter_io_submit                                               |
|     :sys_exit_io_submit                                                      |
|            sys_exit_io_submit                                                |
|     :sys_enter_io_cancel                                                     |
|            sys_enter_io_cancel                                               |
|     :sys_exit_io_cancel                                                      |
|            sys_exit_io_cancel                                                |
|     :sys_enter_io_getevents                                                  |
|            sys_enter_io_getevents                                            |
|     :sys_exit_io_getevents                                                   |
|            sys_exit_io_getevents                                             |
|     :sys_enter_eventfd2                                                      |
|            sys_enter_eventfd2                                                |
|     :sys_exit_eventfd2                                                       |
|            sys_exit_eventfd2                                                 |
|     :sys_enter_eventfd                                                       |
|            sys_enter_eventfd                                                 |
|     :sys_exit_eventfd                                                        |
|            sys_exit_eventfd                                                  |
|     :sys_enter_timerfd_create                                                |
|            sys_enter_timerfd_create                                          |
|     :sys_exit_timerfd_create                                                 |
|            sys_exit_timerfd_create                                           |
|     :sys_enter_timerfd_settime                                               |
|            sys_enter_timerfd_settime                                         |
|     :sys_exit_timerfd_settime                                                |
|            sys_exit_timerfd_settime                                          |
|     :sys_enter_timerfd_gettime                                               |
|            sys_enter_timerfd_gettime                                         |
|     :sys_exit_timerfd_gettime                                                |
|            sys_exit_timerfd_gettime                                          |
|     :sys_enter_signalfd4                                                     |
|            sys_enter_signalfd4                                               |
|     :sys_exit_signalfd4                                                      |
|            sys_exit_signalfd4                                                |
|     :sys_enter_signalfd                                                      |
|            sys_enter_signalfd                                                |
|     :sys_exit_signalfd                                                       |
|            sys_exit_signalfd                                                 |
|     :sys_enter_epoll_create1                                                 |
|            sys_enter_epoll_create1                                           |
|     :sys_exit_epoll_create1                                                  |
|            sys_exit_epoll_create1                                            |
|     :sys_enter_epoll_create                                                  |
|            sys_enter_epoll_create                                            |
|     :sys_exit_epoll_create                                                   |
|            sys_exit_epoll_create                                             |
|     :sys_enter_epoll_ctl                                                     |
|            sys_enter_epoll_ctl                                               |
|     :sys_exit_epoll_ctl                                                      |
|            sys_exit_epoll_ctl                                                |
|     :sys_enter_epoll_wait                                                    |
|            sys_enter_epoll_wait                                              |
|     :sys_exit_epoll_wait                                                     |
|            sys_exit_epoll_wait                                               |
|     :sys_enter_epoll_pwait                                                   |
|            sys_enter_epoll_pwait                                             |
|     :sys_exit_epoll_pwait                                                    |
|            sys_exit_epoll_pwait                                              |
|     :sys_enter_inotify_init1                                                 |
|            sys_enter_inotify_init1                                           |
|     :sys_exit_inotify_init1                                                  |
|            sys_exit_inotify_init1                                            |
|     :sys_enter_inotify_init                                                  |
|            sys_enter_inotify_init                                            |
|     :sys_exit_inotify_init                                                   |
|            sys_exit_inotify_init                                             |
|     :sys_enter_inotify_add_watch                                             |
|            sys_enter_inotify_add_watch                                       |
|     :sys_exit_inotify_add_watch                                              |
|            sys_exit_inotify_add_watch                                        |
|     :sys_enter_inotify_rm_watch                                              |
|            sys_enter_inotify_rm_watch                                        |
|     :sys_exit_inotify_rm_watch                                               |
|            sys_exit_inotify_rm_watch                                         |
|     :sys_enter_ioprio_set                                                    |
|            sys_enter_ioprio_set                                              |
|     :sys_exit_ioprio_set                                                     |
|            sys_exit_ioprio_set                                               |
|     :sys_enter_ioprio_get                                                    |
|            sys_enter_ioprio_get                                              |
|     :sys_exit_ioprio_get                                                     |
|            sys_exit_ioprio_get                                               |
|     :sys_enter_utime                                                         |
|            sys_enter_utime                                                   |
|     :sys_exit_utime                                                          |
|            sys_exit_utime                                                    |
|     :sys_enter_utimensat                                                     |
|            sys_enter_utimensat                                               |
|     :sys_exit_utimensat                                                      |
|            sys_exit_utimensat                                                |
|     :sys_enter_futimesat                                                     |
|            sys_enter_futimesat                                               |
|     :sys_exit_futimesat                                                      |
|            sys_exit_futimesat                                                |
|     :sys_enter_utimes                                                        |
|            sys_enter_utimes                                                  |
|     :sys_exit_utimes                                                         |
|            sys_exit_utimes                                                   |
|     :sys_enter_sync                                                          |
|            sys_enter_sync                                                    |
|     :sys_exit_sync                                                           |
|            sys_exit_sync                                                     |
|     :sys_enter_fsync                                                         |
|            sys_enter_fsync                                                   |
|     :sys_exit_fsync                                                          |
|            sys_exit_fsync                                                    |
|     :sys_enter_fdatasync                                                     |
|            sys_enter_fdatasync                                               |
|     :sys_exit_fdatasync                                                      |
|            sys_exit_fdatasync                                                |
|     :sys_enter_vmsplice                                                      |
|            sys_enter_vmsplice                                                |
|     :sys_exit_vmsplice                                                       |
|            sys_exit_vmsplice                                                 |
|     :sys_enter_splice                                                        |
|            sys_enter_splice                                                  |
|     :sys_exit_splice                                                         |
|            sys_exit_splice                                                   |
|     :sys_enter_tee                                                           |
|            sys_enter_tee                                                     |
|     :sys_exit_tee                                                            |
|            sys_exit_tee                                                      |
|     :sys_enter_setxattr                                                      |
|            sys_enter_setxattr                                                |
|     :sys_exit_setxattr                                                       |
|            sys_exit_setxattr                                                 |
|     :sys_enter_lsetxattr                                                     |
|            sys_enter_lsetxattr                                               |
|     :sys_exit_lsetxattr                                                      |
|            sys_exit_lsetxattr                                                |
|     :sys_enter_fsetxattr                                                     |
|            sys_enter_fsetxattr                                               |
|     :sys_exit_fsetxattr                                                      |
|            sys_exit_fsetxattr                                                |
|     :sys_enter_getxattr                                                      |
|            sys_enter_getxattr                                                |
|     :sys_exit_getxattr                                                       |
|            sys_exit_getxattr                                                 |
|     :sys_enter_lgetxattr                                                     |
|            sys_enter_lgetxattr                                               |
|     :sys_exit_lgetxattr                                                      |
|            sys_exit_lgetxattr                                                |
|     :sys_enter_fgetxattr                                                     |
|            sys_enter_fgetxattr                                               |
|     :sys_exit_fgetxattr                                                      |
|            sys_exit_fgetxattr                                                |
|     :sys_enter_listxattr                                                     |
|            sys_enter_listxattr                                               |
|     :sys_exit_listxattr                                                      |
|            sys_exit_listxattr                                                |
|     :sys_enter_llistxattr                                                    |
|            sys_enter_llistxattr                                              |
|     :sys_exit_llistxattr                                                     |
|            sys_exit_llistxattr                                               |
|     :sys_enter_flistxattr                                                    |
|            sys_enter_flistxattr                                              |
|     :sys_exit_flistxattr                                                     |
|            sys_exit_flistxattr                                               |
|     :sys_enter_removexattr                                                   |
|            sys_enter_removexattr                                             |
|     :sys_exit_removexattr                                                    |
|            sys_exit_removexattr                                              |
|     :sys_enter_lremovexattr                                                  |
|            sys_enter_lremovexattr                                            |
|     :sys_exit_lremovexattr                                                   |
|            sys_exit_lremovexattr                                             |
|     :sys_enter_fremovexattr                                                  |
|            sys_enter_fremovexattr                                            |
|     :sys_exit_fremovexattr                                                   |
|            sys_exit_fremovexattr                                             |
|     :sys_enter_umount                                                        |
|            sys_enter_umount                                                  |
|     :sys_exit_umount                                                         |
|            sys_exit_umount                                                   |
|     :sys_enter_mount                                                         |
|            sys_enter_mount                                                   |
|     :sys_exit_mount                                                          |
|            sys_exit_mount                                                    |
|     :sys_enter_pivot_root                                                    |
|            sys_enter_pivot_root                                              |
|     :sys_exit_pivot_root                                                     |
|            sys_exit_pivot_root                                               |
|     :sys_enter_sysfs                                                         |
|            sys_enter_sysfs                                                   |
|     :sys_exit_sysfs                                                          |
|            sys_exit_sysfs                                                    |
|     :sys_enter_getcwd                                                        |
|            sys_enter_getcwd                                                  |
|     :sys_exit_getcwd                                                         |
|            sys_exit_getcwd                                                   |
|     :sys_enter_select                                                        |
|            sys_enter_select                                                  |
|     :sys_exit_select                                                         |
|            sys_exit_select                                                   |
|     :sys_enter_pselect6                                                      |
|            sys_enter_pselect6                                                |
|     :sys_exit_pselect6                                                       |
|            sys_exit_pselect6                                                 |
|     :sys_enter_poll                                                          |
|            sys_enter_poll                                                    |
|     :sys_exit_poll                                                           |
|            sys_exit_poll                                                     |
|     :sys_enter_ppoll                                                         |
|            sys_enter_ppoll                                                   |
|     :sys_exit_ppoll                                                          |
|            sys_exit_ppoll                                                    |
|     :sys_enter_getdents                                                      |
|            sys_enter_getdents                                                |
|     :sys_exit_getdents                                                       |
|            sys_exit_getdents                                                 |
|     :sys_enter_getdents64                                                    |
|            sys_enter_getdents64                                              |
|     :sys_exit_getdents64                                                     |
|            sys_exit_getdents64                                               |
|     :sys_enter_ioctl                                                         |
|            sys_enter_ioctl                                                   |
|     :sys_exit_ioctl                                                          |
|            sys_exit_ioctl                                                    |
|     :sys_enter_dup3                                                          |
|            sys_enter_dup3                                                    |
|     :sys_exit_dup3                                                           |
|            sys_exit_dup3                                                     |
|     :sys_enter_dup2                                                          |
|            sys_enter_dup2                                                    |
|     :sys_exit_dup2                                                           |
|            sys_exit_dup2                                                     |
|     :sys_enter_dup                                                           |
|            sys_enter_dup                                                     |
|     :sys_exit_dup                                                            |
|            sys_exit_dup                                                      |
|     :sys_enter_fcntl                                                         |
|            sys_enter_fcntl                                                   |
|     :sys_exit_fcntl                                                          |
|            sys_exit_fcntl                                                    |
|     :sys_enter_mknodat                                                       |
|            sys_enter_mknodat                                                 |
|     :sys_exit_mknodat                                                        |
|            sys_exit_mknodat                                                  |
|     :sys_enter_mknod                                                         |
|            sys_enter_mknod                                                   |
|     :sys_exit_mknod                                                          |
|            sys_exit_mknod                                                    |
|     :sys_enter_mkdirat                                                       |
|            sys_enter_mkdirat                                                 |
|     :sys_exit_mkdirat                                                        |
|            sys_exit_mkdirat                                                  |
|     :sys_enter_mkdir                                                         |
|            sys_enter_mkdir                                                   |
|     :sys_exit_mkdir                                                          |
|            sys_exit_mkdir                                                    |
|     :sys_enter_rmdir                                                         |
|            sys_enter_rmdir                                                   |
|     :sys_exit_rmdir                                                          |
|            sys_exit_rmdir                                                    |
|     :sys_enter_unlinkat                                                      |
|            sys_enter_unlinkat                                                |
|     :sys_exit_unlinkat                                                       |
|            sys_exit_unlinkat                                                 |
|     :sys_enter_unlink                                                        |
|            sys_enter_unlink                                                  |
|     :sys_exit_unlink                                                         |
|            sys_exit_unlink                                                   |
|     :sys_enter_symlinkat                                                     |
|            sys_enter_symlinkat                                               |
|     :sys_exit_symlinkat                                                      |
|            sys_exit_symlinkat                                                |
|     :sys_enter_symlink                                                       |
|            sys_enter_symlink                                                 |
|     :sys_exit_symlink                                                        |
|            sys_exit_symlink                                                  |
|     :sys_enter_linkat                                                        |
|            sys_enter_linkat                                                  |
|     :sys_exit_linkat                                                         |
|            sys_exit_linkat                                                   |
|     :sys_enter_link                                                          |
|            sys_enter_link                                                    |
|     :sys_exit_link                                                           |
|            sys_exit_link                                                     |
|     :sys_enter_renameat                                                      |
|            sys_enter_renameat                                                |
|     :sys_exit_renameat                                                       |
|            sys_exit_renameat                                                 |
|     :sys_enter_rename                                                        |
|            sys_enter_rename                                                  |
|     :sys_exit_rename                                                         |
|            sys_exit_rename                                                   |
|     :sys_enter_pipe2                                                         |
|            sys_enter_pipe2                                                   |
|     :sys_exit_pipe2                                                          |
|            sys_exit_pipe2                                                    |
|     :sys_enter_pipe                                                          |
|            sys_enter_pipe                                                    |
|     :sys_exit_pipe                                                           |
|            sys_exit_pipe                                                     |
|     :sys_enter_newstat                                                       |
|            sys_enter_newstat                                                 |
|     :sys_exit_newstat                                                        |
|            sys_exit_newstat                                                  |
|     :sys_enter_newlstat                                                      |
|            sys_enter_newlstat                                                |
|     :sys_exit_newlstat                                                       |
|            sys_exit_newlstat                                                 |
|     :sys_enter_newfstatat                                                    |
|            sys_enter_newfstatat                                              |
|     :sys_exit_newfstatat                                                     |
|            sys_exit_newfstatat                                               |
|     :sys_enter_newfstat                                                      |
|            sys_enter_newfstat                                                |
|     :sys_exit_newfstat                                                       |
|            sys_exit_newfstat                                                 |
|     :sys_enter_readlinkat                                                    |
|            sys_enter_readlinkat                                              |
|     :sys_exit_readlinkat                                                     |
|            sys_exit_readlinkat                                               |
|     :sys_enter_readlink                                                      |
|            sys_enter_readlink                                                |
|     :sys_exit_readlink                                                       |
|            sys_exit_readlink                                                 |
|     :sys_enter_ustat                                                         |
|            sys_enter_ustat                                                   |
|     :sys_exit_ustat                                                          |
|            sys_exit_ustat                                                    |
|     :sys_enter_lseek                                                         |
|            sys_enter_lseek                                                   |
|     :sys_exit_lseek                                                          |
|            sys_exit_lseek                                                    |
|     :sys_enter_read                                                          |
|            sys_enter_read                                                    |
|     :sys_exit_read                                                           |
|            sys_exit_read                                                     |
|     :sys_enter_write                                                         |
|            sys_enter_write                                                   |
|     :sys_exit_write                                                          |
|            sys_exit_write                                                    |
|     :sys_enter_readv                                                         |
|            sys_enter_readv                                                   |
|     :sys_exit_readv                                                          |
|            sys_exit_readv                                                    |
|     :sys_enter_writev                                                        |
|            sys_enter_writev                                                  |
|     :sys_exit_writev                                                         |
|            sys_exit_writev                                                   |
|     :sys_enter_preadv                                                        |
|            sys_enter_preadv                                                  |
|     :sys_exit_preadv                                                         |
|            sys_exit_preadv                                                   |
|     :sys_enter_pwritev                                                       |
|            sys_enter_pwritev                                                 |
|     :sys_exit_pwritev                                                        |
|            sys_exit_pwritev                                                  |
|     :sys_enter_sendfile64                                                    |
|            sys_enter_sendfile64                                              |
|     :sys_exit_sendfile64                                                     |
|            sys_exit_sendfile64                                               |
|     :sys_enter_statfs                                                        |
|            sys_enter_statfs                                                  |
|     :sys_exit_statfs                                                         |
|            sys_exit_statfs                                                   |
|     :sys_enter_fstatfs                                                       |
|            sys_enter_fstatfs                                                 |
|     :sys_exit_fstatfs                                                        |
|            sys_exit_fstatfs                                                  |
|     :sys_enter_truncate                                                      |
|            sys_enter_truncate                                                |
|     :sys_exit_truncate                                                       |
|            sys_exit_truncate                                                 |
|     :sys_enter_ftruncate                                                     |
|            sys_enter_ftruncate                                               |
|     :sys_exit_ftruncate                                                      |
|            sys_exit_ftruncate                                                |
|     :sys_enter_faccessat                                                     |
|            sys_enter_faccessat                                               |
|     :sys_exit_faccessat                                                      |
|            sys_exit_faccessat                                                |
|     :sys_enter_access                                                        |
|            sys_enter_access                                                  |
|     :sys_exit_access                                                         |
|            sys_exit_access                                                   |
|     :sys_enter_chdir                                                         |
|            sys_enter_chdir                                                   |
|     :sys_exit_chdir                                                          |
|            sys_exit_chdir                                                    |
|     :sys_enter_fchdir                                                        |
|            sys_enter_fchdir                                                  |
|     :sys_exit_fchdir                                                         |
|            sys_exit_fchdir                                                   |
|     :sys_enter_chroot                                                        |
|            sys_enter_chroot                                                  |
|     :sys_exit_chroot                                                         |
|            sys_exit_chroot                                                   |
|     :sys_enter_fchmod                                                        |
|            sys_enter_fchmod                                                  |
|     :sys_exit_fchmod                                                         |
|            sys_exit_fchmod                                                   |
|     :sys_enter_fchmodat                                                      |
|            sys_enter_fchmodat                                                |
|     :sys_exit_fchmodat                                                       |
|            sys_exit_fchmodat                                                 |
|     :sys_enter_chmod                                                         |
|            sys_enter_chmod                                                   |
|     :sys_exit_chmod                                                          |
|            sys_exit_chmod                                                    |
|     :sys_enter_chown                                                         |
|            sys_enter_chown                                                   |
|     :sys_exit_chown                                                          |
|            sys_exit_chown                                                    |
|     :sys_enter_fchownat                                                      |
|            sys_enter_fchownat                                                |
|     :sys_exit_fchownat                                                       |
|            sys_exit_fchownat                                                 |
|     :sys_enter_lchown                                                        |
|            sys_enter_lchown                                                  |
|     :sys_exit_lchown                                                         |
|            sys_exit_lchown                                                   |
|     :sys_enter_fchown                                                        |
|            sys_enter_fchown                                                  |
|     :sys_exit_fchown                                                         |
|            sys_exit_fchown                                                   |
|     :sys_enter_open                                                          |
|            sys_enter_open                                                    |
|     :sys_exit_open                                                           |
|            sys_exit_open                                                     |
|     :sys_enter_openat                                                        |
|            sys_enter_openat                                                  |
|     :sys_exit_openat                                                         |
|            sys_exit_openat                                                   |
|     :sys_enter_creat                                                         |
|            sys_enter_creat                                                   |
|     :sys_exit_creat                                                          |
|            sys_exit_creat                                                    |
|     :sys_enter_close                                                         |
|            sys_enter_close                                                   |
|     :sys_exit_close                                                          |
|            sys_exit_close                                                    |
|     :sys_enter_vhangup                                                       |
|            sys_enter_vhangup                                                 |
|     :sys_exit_vhangup                                                        |
|            sys_exit_vhangup                                                  |
|     :sys_enter_move_pages                                                    |
|            sys_enter_move_pages                                              |
|     :sys_exit_move_pages                                                     |
|            sys_exit_move_pages                                               |
|     :sys_enter_mbind                                                         |
|            sys_enter_mbind                                                   |
|     :sys_exit_mbind                                                          |
|            sys_exit_mbind                                                    |
|     :sys_enter_set_mempolicy                                                 |
|            sys_enter_set_mempolicy                                           |
|     :sys_exit_set_mempolicy                                                  |
|            sys_exit_set_mempolicy                                            |
|     :sys_enter_migrate_pages                                                 |
|            sys_enter_migrate_pages                                           |
|     :sys_exit_migrate_pages                                                  |
|            sys_exit_migrate_pages                                            |
|     :sys_enter_get_mempolicy                                                 |
|            sys_enter_get_mempolicy                                           |
|     :sys_exit_get_mempolicy                                                  |
|            sys_exit_get_mempolicy                                            |
|     :sys_enter_swapoff                                                       |
|            sys_enter_swapoff                                                 |
|     :sys_exit_swapoff                                                        |
|            sys_exit_swapoff                                                  |
|     :sys_enter_swapon                                                        |
|            sys_enter_swapon                                                  |
|     :sys_exit_swapon                                                         |
|            sys_exit_swapon                                                   |
|     :sys_enter_msync                                                         |
|            sys_enter_msync                                                   |
|     :sys_exit_msync                                                          |
|            sys_exit_msync                                                    |
|     :sys_enter_mremap                                                        |
|            sys_enter_mremap                                                  |
|     :sys_exit_mremap                                                         |
|            sys_exit_mremap                                                   |
|     :sys_enter_mprotect                                                      |
|            sys_enter_mprotect                                                |
|     :sys_exit_mprotect                                                       |
|            sys_exit_mprotect                                                 |
|     :sys_enter_brk                                                           |
|            sys_enter_brk                                                     |
|     :sys_exit_brk                                                            |
|            sys_exit_brk                                                      |
|     :sys_enter_munmap                                                        |
|            sys_enter_munmap                                                  |
|     :sys_exit_munmap                                                         |
|            sys_exit_munmap                                                   |
|     :sys_enter_mlock                                                         |
|            sys_enter_mlock                                                   |
|     :sys_exit_mlock                                                          |
|            sys_exit_mlock                                                    |
|     :sys_enter_munlock                                                       |
|            sys_enter_munlock                                                 |
|     :sys_exit_munlock                                                        |
|            sys_exit_munlock                                                  |
|     :sys_enter_mlockall                                                      |
|            sys_enter_mlockall                                                |
|     :sys_exit_mlockall                                                       |
|            sys_exit_mlockall                                                 |
|     :sys_enter_munlockall                                                    |
|            sys_enter_munlockall                                              |
|     :sys_exit_munlockall                                                     |
|            sys_exit_munlockall                                               |
|     :sys_enter_mincore                                                       |
|            sys_enter_mincore                                                 |
|     :sys_exit_mincore                                                        |
|            sys_exit_mincore                                                  |
|     :sys_enter_madvise                                                       |
|            sys_enter_madvise                                                 |
|     :sys_exit_madvise                                                        |
|            sys_exit_madvise                                                  |
|     :sys_enter_remap_file_pages                                              |
|            sys_enter_remap_file_pages                                        |
|     :sys_exit_remap_file_pages                                               |
|            sys_exit_remap_file_pages                                         |
|     :sys_enter_perf_event_open                                               |
|            sys_enter_perf_event_open                                         |
|     :sys_exit_perf_event_open                                                |
|            sys_exit_perf_event_open                                          |
|     :sys_enter_kexec_load                                                    |
|            sys_enter_kexec_load                                              |
|     :sys_exit_kexec_load                                                     |
|            sys_exit_kexec_load                                               |
|     :sys_enter_acct                                                          |
|            sys_enter_acct                                                    |
|     :sys_exit_acct                                                           |
|            sys_exit_acct                                                     |
|     :sys_enter_delete_module                                                 |
|            sys_enter_delete_module                                           |
|     :sys_exit_delete_module                                                  |
|            sys_exit_delete_module                                            |
|     :sys_enter_init_module                                                   |
|            sys_enter_init_module                                             |
|     :sys_exit_init_module                                                    |
|            sys_exit_init_module                                              |
|     :sys_enter_set_robust_list                                               |
|            sys_enter_set_robust_list                                         |
|     :sys_exit_set_robust_list                                                |
|            sys_exit_set_robust_list                                          |
|     :sys_enter_get_robust_list                                               |
|            sys_enter_get_robust_list                                         |
|     :sys_exit_get_robust_list                                                |
|            sys_exit_get_robust_list                                          |
|     :sys_enter_futex                                                         |
|            sys_enter_futex                                                   |
|     :sys_exit_futex                                                          |
|            sys_exit_futex                                                    |
|     :sys_enter_getgroups                                                     |
|            sys_enter_getgroups                                               |
|     :sys_exit_getgroups                                                      |
|            sys_exit_getgroups                                                |
|     :sys_enter_setgroups                                                     |
|            sys_enter_setgroups                                               |
|     :sys_exit_setgroups                                                      |
|            sys_exit_setgroups                                                |
|     :sys_enter_nanosleep                                                     |
|            sys_enter_nanosleep                                               |
|     :sys_exit_nanosleep                                                      |
|            sys_exit_nanosleep                                                |
|     :sys_enter_timer_create                                                  |
|            sys_enter_timer_create                                            |
|     :sys_exit_timer_create                                                   |
|            sys_exit_timer_create                                             |
|     :sys_enter_timer_gettime                                                 |
|            sys_enter_timer_gettime                                           |
|     :sys_exit_timer_gettime                                                  |
|            sys_exit_timer_gettime                                            |
|     :sys_enter_timer_getoverrun                                              |
|            sys_enter_timer_getoverrun                                        |
|     :sys_exit_timer_getoverrun                                               |
|            sys_exit_timer_getoverrun                                         |
|     :sys_enter_timer_settime                                                 |
|            sys_enter_timer_settime                                           |
|     :sys_exit_timer_settime                                                  |
|            sys_exit_timer_settime                                            |
|     :sys_enter_timer_delete                                                  |
|            sys_enter_timer_delete                                            |
|     :sys_exit_timer_delete                                                   |
|            sys_exit_timer_delete                                             |
|     :sys_enter_clock_settime                                                 |
|            sys_enter_clock_settime                                           |
|     :sys_exit_clock_settime                                                  |
|            sys_exit_clock_settime                                            |
|     :sys_enter_clock_gettime                                                 |
|            sys_enter_clock_gettime                                           |
|     :sys_exit_clock_gettime                                                  |
|            sys_exit_clock_gettime                                            |
|     :sys_enter_clock_getres                                                  |
|            sys_enter_clock_getres                                            |
|     :sys_exit_clock_getres                                                   |
|            sys_exit_clock_getres                                             |
|     :sys_enter_clock_nanosleep                                               |
|            sys_enter_clock_nanosleep                                         |
|     :sys_exit_clock_nanosleep                                                |
|            sys_exit_clock_nanosleep                                          |
|     :sys_enter_setpriority                                                   |
|            sys_enter_setpriority                                             |
|     :sys_exit_setpriority                                                    |
|            sys_exit_setpriority                                              |
|     :sys_enter_getpriority                                                   |
|            sys_enter_getpriority                                             |
|     :sys_exit_getpriority                                                    |
|            sys_exit_getpriority                                              |
|     :sys_enter_reboot                                                        |
|            sys_enter_reboot                                                  |
|     :sys_exit_reboot                                                         |
|            sys_exit_reboot                                                   |
|     :sys_enter_setregid                                                      |
|            sys_enter_setregid                                                |
|     :sys_exit_setregid                                                       |
|            sys_exit_setregid                                                 |
|     :sys_enter_setgid                                                        |
|            sys_enter_setgid                                                  |
|     :sys_exit_setgid                                                         |
|            sys_exit_setgid                                                   |
|     :sys_enter_setreuid                                                      |
|            sys_enter_setreuid                                                |
|     :sys_exit_setreuid                                                       |
|            sys_exit_setreuid                                                 |
|     :sys_enter_setuid                                                        |
|            sys_enter_setuid                                                  |
|     :sys_exit_setuid                                                         |
|            sys_exit_setuid                                                   |
|     :sys_enter_setresuid                                                     |
|            sys_enter_setresuid                                               |
|     :sys_exit_setresuid                                                      |
|            sys_exit_setresuid                                                |
|     :sys_enter_getresuid                                                     |
|            sys_enter_getresuid                                               |
|     :sys_exit_getresuid                                                      |
|            sys_exit_getresuid                                                |
|     :sys_enter_setresgid                                                     |
|            sys_enter_setresgid                                               |
|     :sys_exit_setresgid                                                      |
|            sys_exit_setresgid                                                |
|     :sys_enter_getresgid                                                     |
|            sys_enter_getresgid                                               |
|     :sys_exit_getresgid                                                      |
|            sys_exit_getresgid                                                |
|     :sys_enter_setfsuid                                                      |
|            sys_enter_setfsuid                                                |
|     :sys_exit_setfsuid                                                       |
|            sys_exit_setfsuid                                                 |
|     :sys_enter_setfsgid                                                      |
|            sys_enter_setfsgid                                                |
|     :sys_exit_setfsgid                                                       |
|            sys_exit_setfsgid                                                 |
|     :sys_enter_times                                                         |
|            sys_enter_times                                                   |
|     :sys_exit_times                                                          |
|            sys_exit_times                                                    |
|     :sys_enter_setpgid                                                       |
|            sys_enter_setpgid                                                 |
|     :sys_exit_setpgid                                                        |
|            sys_exit_setpgid                                                  |
|     :sys_enter_getpgid                                                       |
|            sys_enter_getpgid                                                 |
|     :sys_exit_getpgid                                                        |
|            sys_exit_getpgid                                                  |
|     :sys_enter_getpgrp                                                       |
|            sys_enter_getpgrp                                                 |
|     :sys_exit_getpgrp                                                        |
|            sys_exit_getpgrp                                                  |
|     :sys_enter_getsid                                                        |
|            sys_enter_getsid                                                  |
|     :sys_exit_getsid                                                         |
|            sys_exit_getsid                                                   |
|     :sys_enter_setsid                                                        |
|            sys_enter_setsid                                                  |
|     :sys_exit_setsid                                                         |
|            sys_exit_setsid                                                   |
|     :sys_enter_sethostname                                                   |
|            sys_enter_sethostname                                             |
|     :sys_exit_sethostname                                                    |
|            sys_exit_sethostname                                              |
|     :sys_enter_setdomainname                                                 |
|            sys_enter_setdomainname                                           |
|     :sys_exit_setdomainname                                                  |
|            sys_exit_setdomainname                                            |
|     :sys_enter_getrlimit                                                     |
|            sys_enter_getrlimit                                               |
|     :sys_exit_getrlimit                                                      |
|            sys_exit_getrlimit                                                |
|     :sys_enter_setrlimit                                                     |
|            sys_enter_setrlimit                                               |
|     :sys_exit_setrlimit                                                      |
|            sys_exit_setrlimit                                                |
|     :sys_enter_getrusage                                                     |
|            sys_enter_getrusage                                               |
|     :sys_exit_getrusage                                                      |
|            sys_exit_getrusage                                                |
|     :sys_enter_umask                                                         |
|            sys_enter_umask                                                   |
|     :sys_exit_umask                                                          |
|            sys_exit_umask                                                    |
|     :sys_enter_prctl                                                         |
|            sys_enter_prctl                                                   |
|     :sys_exit_prctl                                                          |
|            sys_exit_prctl                                                    |
|     :sys_enter_restart_syscall                                               |
|            sys_enter_restart_syscall                                         |
|     :sys_exit_restart_syscall                                                |
|            sys_exit_restart_syscall                                          |
|     :sys_enter_rt_sigprocmask                                                |
|            sys_enter_rt_sigprocmask                                          |
|     :sys_exit_rt_sigprocmask                                                 |
|            sys_exit_rt_sigprocmask                                           |
|     :sys_enter_rt_sigpending                                                 |
|            sys_enter_rt_sigpending                                           |
|     :sys_exit_rt_sigpending                                                  |
|            sys_exit_rt_sigpending                                            |
|     :sys_enter_rt_sigtimedwait                                               |
|            sys_enter_rt_sigtimedwait                                         |
|     :sys_exit_rt_sigtimedwait                                                |
|            sys_exit_rt_sigtimedwait                                          |
|     :sys_enter_kill                                                          |
|            sys_enter_kill                                                    |
|     :sys_exit_kill                                                           |
|            sys_exit_kill                                                     |
|     :sys_enter_tgkill                                                        |
|            sys_enter_tgkill                                                  |
|     :sys_exit_tgkill                                                         |
|            sys_exit_tgkill                                                   |
|     :sys_enter_tkill                                                         |
|            sys_enter_tkill                                                   |
|     :sys_exit_tkill                                                          |
|            sys_exit_tkill                                                    |
|     :sys_enter_rt_sigqueueinfo                                               |
|            sys_enter_rt_sigqueueinfo                                         |
|     :sys_exit_rt_sigqueueinfo                                                |
|            sys_exit_rt_sigqueueinfo                                          |
|     :sys_enter_rt_tgsigqueueinfo                                             |
|            sys_enter_rt_tgsigqueueinfo                                       |
|     :sys_exit_rt_tgsigqueueinfo                                              |
|            sys_exit_rt_tgsigqueueinfo                                        |
|     :sys_enter_rt_sigaction                                                  |
|            sys_enter_rt_sigaction                                            |
|     :sys_exit_rt_sigaction                                                   |
|            sys_exit_rt_sigaction                                             |
|     :sys_enter_pause                                                         |
|            sys_enter_pause                                                   |
|     :sys_exit_pause                                                          |
|            sys_exit_pause                                                    |
|     :sys_enter_rt_sigsuspend                                                 |
|            sys_enter_rt_sigsuspend                                           |
|     :sys_exit_rt_sigsuspend                                                  |
|            sys_exit_rt_sigsuspend                                            |
|     :sys_enter_alarm                                                         |
|            sys_enter_alarm                                                   |
|     :sys_exit_alarm                                                          |
|            sys_exit_alarm                                                    |
|     :sys_enter_getpid                                                        |
|            sys_enter_getpid                                                  |
|     :sys_exit_getpid                                                         |
|            sys_exit_getpid                                                   |
|     :sys_enter_getppid                                                       |
|            sys_enter_getppid                                                 |
|     :sys_exit_getppid                                                        |
|            sys_exit_getppid                                                  |
|     :sys_enter_getuid                                                        |
|            sys_enter_getuid                                                  |
|     :sys_exit_getuid                                                         |
|            sys_exit_getuid                                                   |
|     :sys_enter_geteuid                                                       |
|            sys_enter_geteuid                                                 |
|     :sys_exit_geteuid                                                        |
|            sys_exit_geteuid                                                  |
|     :sys_enter_getgid                                                        |
|            sys_enter_getgid                                                  |
|     :sys_exit_getgid                                                         |
|            sys_exit_getgid                                                   |
|     :sys_enter_getegid                                                       |
|            sys_enter_getegid                                                 |
|     :sys_exit_getegid                                                        |
|            sys_exit_getegid                                                  |
|     :sys_enter_gettid                                                        |
|            sys_enter_gettid                                                  |
|     :sys_exit_gettid                                                         |
|            sys_exit_gettid                                                   |
|     :sys_enter_sysinfo                                                       |
|            sys_enter_sysinfo                                                 |
|     :sys_exit_sysinfo                                                        |
|            sys_exit_sysinfo                                                  |
|     :sys_enter_ptrace                                                        |
|            sys_enter_ptrace                                                  |
|     :sys_exit_ptrace                                                         |
|            sys_exit_ptrace                                                   |
|     :sys_enter_capget                                                        |
|            sys_enter_capget                                                  |
|     :sys_exit_capget                                                         |
|            sys_exit_capget                                                   |
|     :sys_enter_capset                                                        |
|            sys_enter_capset                                                  |
|     :sys_exit_capset                                                         |
|            sys_exit_capset                                                   |
|     :sys_enter_sysctl                                                        |
|            sys_enter_sysctl                                                  |
|     :sys_exit_sysctl                                                         |
|            sys_exit_sysctl                                                   |
|     :sys_enter_time                                                          |
|            sys_enter_time                                                    |
|     :sys_exit_time                                                           |
|            sys_exit_time                                                     |
|     :sys_enter_gettimeofday                                                  |
|            sys_enter_gettimeofday                                            |
|     :sys_exit_gettimeofday                                                   |
|            sys_exit_gettimeofday                                             |
|     :sys_enter_settimeofday                                                  |
|            sys_enter_settimeofday                                            |
|     :sys_exit_settimeofday                                                   |
|            sys_exit_settimeofday                                             |
|     :sys_enter_adjtimex                                                      |
|            sys_enter_adjtimex                                                |
|     :sys_exit_adjtimex                                                       |
|            sys_exit_adjtimex                                                 |
|     :sys_enter_getitimer                                                     |
|            sys_enter_getitimer                                               |
|     :sys_exit_getitimer                                                      |
|            sys_exit_getitimer                                                |
|     :sys_enter_setitimer                                                     |
|            sys_enter_setitimer                                               |
|     :sys_exit_setitimer                                                      |
|            sys_exit_setitimer                                                |
|     :sys_enter_exit                                                          |
|            sys_enter_exit                                                    |
|     :sys_exit_exit                                                           |
|            sys_exit_exit                                                     |
|     :sys_enter_exit_group                                                    |
|            sys_enter_exit_group                                              |
|     :sys_exit_exit_group                                                     |
|            sys_exit_exit_group                                               |
|     :sys_enter_waitid                                                        |
|            sys_enter_waitid                                                  |
|     :sys_exit_waitid                                                         |
|            sys_exit_waitid                                                   |
|     :sys_enter_wait4                                                         |
|            sys_enter_wait4                                                   |
|     :sys_exit_wait4                                                          |
|            sys_exit_wait4                                                    |
|     :sys_enter_syslog                                                        |
|            sys_enter_syslog                                                  |
|     :sys_exit_syslog                                                         |
|            sys_exit_syslog                                                   |
|     :sys_enter_personality                                                   |
|            sys_enter_personality                                             |
|     :sys_exit_personality                                                    |
|            sys_exit_personality                                              |
|     :sys_enter_set_tid_address                                               |
|            sys_enter_set_tid_address                                         |
|     :sys_exit_set_tid_address                                                |
|            sys_exit_set_tid_address                                          |
|     :sys_enter_unshare                                                       |
|            sys_enter_unshare                                                 |
|     :sys_exit_unshare                                                        |
|            sys_exit_unshare                                                  |
|     :sys_enter_sched_setscheduler                                            |
|            sys_enter_sched_setscheduler                                      |
|     :sys_exit_sched_setscheduler                                             |
|            sys_exit_sched_setscheduler                                       |
|     :sys_enter_sched_setparam                                                |
|            sys_enter_sched_setparam                                          |
|     :sys_exit_sched_setparam                                                 |
|            sys_exit_sched_setparam                                           |
|     :sys_enter_sched_getscheduler                                            |
|            sys_enter_sched_getscheduler                                      |
|     :sys_exit_sched_getscheduler                                             |
|            sys_exit_sched_getscheduler                                       |
|     :sys_enter_sched_getparam                                                |
|            sys_enter_sched_getparam                                          |
|     :sys_exit_sched_getparam                                                 |
|            sys_exit_sched_getparam                                           |
|     :sys_enter_sched_setaffinity                                             |
|            sys_enter_sched_setaffinity                                       |
|     :sys_exit_sched_setaffinity                                              |
|            sys_exit_sched_setaffinity                                        |
|     :sys_enter_sched_getaffinity                                             |
|            sys_enter_sched_getaffinity                                       |
|     :sys_exit_sched_getaffinity                                              |
|            sys_exit_sched_getaffinity                                        |
|     :sys_enter_sched_yield                                                   |
|            sys_enter_sched_yield                                             |
|     :sys_exit_sched_yield                                                    |
|            sys_exit_sched_yield                                              |
|     :sys_enter_sched_get_priority_max                                        |
|            sys_enter_sched_get_priority_max                                  |
|     :sys_exit_sched_get_priority_max                                         |
|            sys_exit_sched_get_priority_max                                   |
|     :sys_enter_sched_get_priority_min                                        |
|            sys_enter_sched_get_priority_min                                  |
|     :sys_exit_sched_get_priority_min                                         |
|            sys_exit_sched_get_priority_min                                   |
|     :sys_enter_sched_rr_get_interval                                         |
|            sys_enter_sched_rr_get_interval                                   |
|     :sys_exit_sched_rr_get_interval                                          |
|            sys_exit_sched_rr_get_interval                                    |
|     :sys_enter                                                               |
|            sys_enter                                                         |
|     :sys_exit                                                                |
|            sys_exit                                                          |
|     :sys_enter_mmap                                                          |
|            sys_enter_mmap                                                    |
|     :sys_exit_mmap                                                           |
|            sys_exit_mmap                                                     |
|     :sys_enter_uname                                                         |
|            sys_enter_uname                                                   |
|     :sys_exit_uname                                                          |
|            sys_exit_uname                                                    |
--------------------------------------------------------------------------------
| AGU_BYPASS_CANCEL                                                            |
|            Number of executed load operations with all the following traits: |
|            1. addressing of the format [base + offset], 2. the offset is betw|
|            een 1 and 2047, 3. the address specified in the base register is i|
|            n one page and the address [base+offset] is in another page       |
|     :COUNT                                                                   |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:This event counts executed load operations                      |
|     :e=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:edge level (may require counter-mask >= 1)                      |
|     :i=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:invert                                                          |
|     :c=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:counter-mask in range [0-255]                                   |
|     :t=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:measure any thread                                              |
|     :u=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:monitor at user level                                           |
|     :k=0                                                                     |
|             1. addressing of the format [base + offset], 2. the offset is bet|
|            ween 1 and 2047, 3. the address specified in the base register is |
|            in one page and the address [base+offset] is in another page, mask|
|            s:monitor at kernel level                                         |
--------------------------------------------------------------------------------
| ARITH                                                                        |
|            Counts arithmetic multiply operations                             |
|     :FPU_DIV_ACTIVE                                                          |
|            Cycles that the divider is active, includes integer and floating p|
|            oint                                                              |
|     :FPU_DIV                                                                 |
|            Number of cycles the divider is activated, includes integer and fl|
|            oating point                                                      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BACLEARS                                                                     |
|            Branch resteered                                                  |
|     :ANY                                                                     |
|            Counts the number of times the front end is resteered, mainly when|
|             the BPU cannot provide a correct prediction and this is corrected|
|             by other branch handling mechanisms at the front end             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BR_INST_EXEC                                                                 |
|            Branch instructions executed                                      |
|     :NONTAKEN_COND                                                           |
|            All macro conditional non-taken branch instructions               |
|     :TAKEN_COND                                                              |
|            All macro conditional taken branch instructions                   |
|     :NONTAKEN_DIRECT_JUMP                                                    |
|            All macro unconditional non-taken branch instructions, excluding c|
|            alls and indirects                                                |
|     :TAKEN_DIRECT_JUMP                                                       |
|            All macro unconditional taken branch instructions, excluding calls|
|             and indirects                                                    |
|     :NONTAKEN_INDIRECT_JUMP_NON_CALL_RET                                     |
|            All non-taken indirect branches that are not calls nor returns    |
|     :TAKEN_INDIRECT_JUMP_NON_CALL_RET                                        |
|            All taken indirect branches that are not calls nor returns        |
|     :TAKEN_RETURN_NEAR                                                       |
|            All taken indirect branches that have a return mnemonic           |
|     :TAKEN_DIRECT_NEAR_CALL                                                  |
|            All taken non-indirect calls                                      |
|     :TAKEN_INDIRECT_NEAR_CALL                                                |
|            All taken indirect calls, including both register and memory indir|
|            ect                                                               |
|     :ALL_BRANCHES                                                            |
|            All near executed branches instructions (not necessarily retired) |
|     :ALL_CONDITIONAL                                                         |
|            All macro conditional branch instructions                         |
|     :ANY_COND                                                                |
|            All macro conditional branch instructions                         |
|     :ANY_INDIRECT_JUMP_NON_CALL_RET                                          |
|            All indirect branches that are not calls nor returns              |
|     :ANY_DIRECT_NEAR_CALL                                                    |
|            All non-indirect calls                                            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BR_INST_RETIRED                                                              |
|            Retired branch instructions                                       |
|     :ALL_BRANCHES                                                            |
|            All taken and not taken macro branches including far branches (Pre|
|            cise Event)                                                       |
|     :CONDITIONAL                                                             |
|            All taken and not taken macro conditional branch instructions (Pre|
|            cise Event)                                                       |
|     :FAR_BRANCH                                                              |
|            Number of far branch instructions retired (Precise Event)         |
|     :NEAR_CALL                                                               |
|            All macro direct and indirect near calls, does not count far calls|
|             (Precise Event)                                                  |
|     :NEAR_RETURN                                                             |
|            Number of near ret instructions retired (Precise Event)           |
|     :NEAR_TAKEN                                                              |
|            Number of near branch taken instructions retired (Precise Event)  |
|     :NOT_TAKEN                                                               |
|            All not taken macro branch instructions retired (Precise Event)   |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BR_MISP_EXEC                                                                 |
|            Mispredicted branches executed                                    |
|     :NONTAKEN_COND                                                           |
|            All non-taken mispredicted macro conditional branch instructions  |
|     :TAKEN_COND                                                              |
|            All taken mispredicted macro conditional branch instructions      |
|     :NONTAKEN_INDIRECT_JUMP_NON_CALL_RET                                     |
|            All non-taken mispredicted indirect branches that are not calls no|
|            r returns                                                         |
|     :TAKEN_INDIRECT_JUMP_NON_CALL_RET                                        |
|            All taken mispredicted indirect branches that are not calls nor re|
|            turns                                                             |
|     :NONTAKEN_RETURN_NEAR                                                    |
|            All non-taken mispredicted indirect branches that have a return mn|
|            emonic                                                            |
|     :TAKEN_RETURN_NEAR                                                       |
|            All taken mispredicted indirect branches that have a return mnemon|
|            ic                                                                |
|     :NONTAKEN_DIRECT_NEAR_CALL                                               |
|            All non-taken mispredicted non-indirect calls                     |
|     :TAKEN_DIRECT_NEAR_CALL                                                  |
|            All taken mispredicted non-indirect calls                         |
|     :NONTAKEN_INDIRECT_NEAR_CALL                                             |
|            All nontaken mispredicted indirect calls, including both register |
|            and memory indirect                                               |
|     :TAKEN_INDIRECT_NEAR_CALL                                                |
|            All taken mispredicted indirect calls, including both register and|
|             memory indirect                                                  |
|     :ANY_COND                                                                |
|            All mispredicted macro conditional branch instructions            |
|     :ANY_RETURN_NEAR                                                         |
|            All mispredicted indirect branches that have a return mnemonic    |
|     :ANY_DIRECT_NEAR_CALL                                                    |
|            All mispredicted non-indirect calls                               |
|     :ANY_INDIRECT_JUMP_NON_CALL_RET                                          |
|            All mispredicted indirect branches that are not calls nor returns |
|     :ALL_BRANCHES                                                            |
|            All mispredicted branch instructions                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BR_MISP_RETIRED                                                              |
|            Mispredicted retired branches                                     |
|     :ALL_BRANCHES                                                            |
|            All mispredicted macro branches (Precise Event)                   |
|     :CONDITIONAL                                                             |
|            All mispredicted macro conditional branch instructions (Precise Ev|
|            ent)                                                              |
|     :NEAR_CALL                                                               |
|            All macro direct and indirect near calls (Precise Event)          |
|     :NOT_TAKEN                                                               |
|            Number of branch instructions retired that were mispredicted and n|
|            ot-taken (Precise Event)                                          |
|     :TAKEN                                                                   |
|            Number of branch instructions retired that were mispredicted and t|
|            aken (Precise Event)                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| BRANCH_INSTRUCTIONS_RETIRED                                                  |
|            Count branch instructions at retirement. Specifically, this event |
|            counts the retirement of the last micro-op of a branch instruction|
|                                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MISPREDICTED_BRANCH_RETIRED                                                  |
|            Count mispredicted branch instructions at retirement. Specifically|
|            , this event counts at retirement of the last micro-op of a branch|
|             instruction in the architectural path of the execution and experi|
|            enced misprediction in the branch prediction hardware             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LOCK_CYCLES                                                                  |
|            Locked cycles in L1D and L2                                       |
|     :SPLIT_LOCK_UC_LOCK_DURATION                                             |
|            Cycles in which the L1D and L2 are locked, due to a UC lock or spl|
|            it lock                                                           |
|     :CACHE_LOCK_DURATION                                                     |
|            Cycles in which the L1D is locked                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| CPL_CYCLES                                                                   |
|            Unhalted core cycles at a specific ring level                     |
|     :RING0                                                                   |
|            Unhalted core cycles the thread was in ring 0                     |
|     :RING0_TRANS                                                             |
|            Transitions from rings 1, 2, or 3 to ring 0                       |
|     :RING123                                                                 |
|            Unhalted core cycles the thread was in rings 1, 2, or 3           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| CPU_CLK_UNHALTED                                                             |
|            Cycles when processor is not in halted state                      |
|     :REF_P                                                                   |
|            Cycles when the core is unhalted (count at 100 Mhz)               |
|     :THREAD_P                                                                |
|            Cycles when thread is not halted                                  |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| DSB2MITE_SWITCHES                                                            |
|            Number of DSB to MITE switches                                    |
|     :COUNT                                                                   |
|            Number of DSB to MITE switches                                    |
|     :PENALTY_CYCLES                                                          |
|            Cycles SB to MITE switches caused delay                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| DSB_FILL                                                                     |
|            DSB fills                                                         |
|     :ALL_CANCEL                                                              |
|            Number of times a valid DSB fill has been cancelled for any reason|
|                                                                              |
|     :EXCEED_DSB_LINES                                                        |
|            DSB Fill encountered > 3 DSB lines                                |
|     :OTHER_CANCEL                                                            |
|            Number of times a valid DSB fill has been cancelled not because of|
|             exceeding way limit                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| DTLB_LOAD_MISSES                                                             |
|            Data TLB load misses                                              |
|     :MISS_CAUSES_A_WALK                                                      |
|            Demand load miss in all TLB levels which causes an page walk of an|
|            y page size                                                       |
|     :CAUSES_A_WALK                                                           |
|            Demand load miss in all TLB levels which causes an page walk of an|
|            y page size                                                       |
|     :STLB_HIT                                                                |
|            Number of DTLB lookups for loads which missed first level DTLB but|
|             hit second level DTLB (STLB); No page walk.                      |
|     :WALK_COMPLETED                                                          |
|            Demand load miss in all TLB levels which causes a page walk that c|
|            ompletes for any page size                                        |
|     :WALK_DURATION                                                           |
|            Cycles PMH is busy with a walk                                    |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| DTLB_STORE_MISSES                                                            |
|            Data TLB store misses                                             |
|     :MISS_CAUSES_A_WALK                                                      |
|            Miss in all TLB levels that causes a page walk of any page size (4|
|            K/2M/4M/1G)                                                       |
|     :CAUSES_A_WALK                                                           |
|            Miss in all TLB levels that causes a page walk of any page size (4|
|            K/2M/4M/1G)                                                       |
|     :STLB_HIT                                                                |
|            First level miss but second level hit; no page walk. Only relevant|
|             if multiple levels                                               |
|     :WALK_COMPLETED                                                          |
|            Miss in all TLB levels that causes a page walk that completes of a|
|            ny page size (4K/2M/4M/1G)                                        |
|     :WALK_DURATION                                                           |
|            Cycles PMH is busy with this walk                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| FP_ASSIST                                                                    |
|            X87 Floating point assists                                        |
|     :ANY                                                                     |
|            Cycles with any input/output SSE or FP assists                    |
|     :SIMD_INPUT                                                              |
|            Number of SIMD FP assists due to input values                     |
|     :SIMD_OUTPUT                                                             |
|            Number of SIMD FP assists due to output values                    |
|     :X87_INPUT                                                               |
|            Number of X87 assists due to input value                          |
|     :X87_OUTPUT                                                              |
|            Number of X87 assists due to output value                         |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| FP_COMP_OPS_EXE                                                              |
|            Counts number of floating point events                            |
|     :X87                                                                     |
|            Number of X87 uops executed                                       |
|     :SSE_FP_PACKED_DOUBLE                                                    |
|            Number of SSE double precision FP packed uops executed            |
|     :SSE_FP_SCALAR_SINGLE                                                    |
|            Number of SSE single precision FP scalar uops executed            |
|     :SSE_PACKED_SINGLE                                                       |
|            Number of SSE single precision FP packed uops executed            |
|     :SSE_SCALAR_DOUBLE                                                       |
|            Number of SSE double precision FP scalar uops executed            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| HW_INTERRUPTS                                                                |
|            Number of hardware interrupts received by the processor           |
|     :RECEIVED                                                                |
|            Number of hardware interrupts received by the processor           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| HW_PRE_REQ                                                                   |
|            Hardware prefetch requests                                        |
|     :L1D_MISS                                                                |
|            Hardware prefetch requests that misses the L1D cache. A request is|
|             counted each time it accesses the cache and misses it, including |
|            if a block is applicable or if it hits the full buffer, for exampl|
|            e. This accounts for both L1 streamer and IP-based Hw prefetchers |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ICACHE                                                                       |
|            Instruction Cache accesses                                        |
|     :MISSES                                                                  |
|            Number of Instruction Cache, Streaming Buffer and Victim Cache Mis|
|            ses. Includes UC accesses                                         |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| IDQ                                                                          |
|            IDQ operations                                                    |
|     :EMPTY                                                                   |
|            Cycles IDQ is empty                                               |
|     :MITE_UOPS                                                               |
|            Number of uops delivered to IDQ from MITE path                    |
|     :DSB_UOPS                                                                |
|            Number of uops delivered to IDQ from DSB path                     |
|     :MS_DSB_UOPS                                                             |
|            Number of uops delivered to IDQ when MS busy by DSB               |
|     :MS_MITE_UOPS                                                            |
|            Number of uops delivered to IDQ when MS busy by MITE              |
|     :MS_UOPS                                                                 |
|            Number of uops were delivered to IDQ from MS by either DSB or MITE|
|                                                                              |
|     :MITE_UOPS_CYCLES                                                        |
|            Cycles where uops are delivered to IDQ from MITE (MITE active)    |
|     :DSB_UOPS_CYCLES                                                         |
|            Cycles where uops are delivered to IDQ from DSB (DSB active)      |
|     :MS_DSB_UOPS_CYCLES                                                      |
|            Cycles where uops delivered to IDQ when MS busy by DSB            |
|     :MS_MITE_UOPS_CYCLES                                                     |
|            Cycles where uops delivered to IDQ when MS busy by MITE           |
|     :MS_UOPS_CYCLES                                                          |
|            Cycles where uops delivered to IDQ from MS by either BSD or MITE  |
|     :ALL_DSB_UOPS                                                            |
|            Number of uops deliver from either DSB paths                      |
|     :ALL_DSB_CYCLES                                                          |
|            Cycles MITE/MS deliver anything                                   |
|     :ALL_MITE_UOPS                                                           |
|            Number of uops delivered from either MITE paths                   |
|     :ALL_MITE_CYCLES                                                         |
|            Cycles DSB/MS deliver anything                                    |
|     :ANY_UOPS                                                                |
|            Number of uops delivered to IDQ from any path                     |
|     :MS_DSB_UOPS_OCCUR                                                       |
|            Occurences of DSB MS going active                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| IDQ_UOPS_NOT_DELIVERED                                                       |
|            Uops not delivered                                                |
|     :CORE                                                                    |
|            Number of non-delivered uops to RAT (use cmask to qualify further)|
|                                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ILD_STALL                                                                    |
|            Instruction Length Decoder stalls                                 |
|     :LCP                                                                     |
|            Stall caused by changing prefix length of the instruction         |
|     :IQ_FULL                                                                 |
|            Stall cycles due to IQ full                                       |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| INSTS_WRITTEN_TO_IQ                                                          |
|            Instructions written to IQ                                        |
|     :INSTS                                                                   |
|            Number of instructions written to IQ every cycle                  |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| INST_RETIRED                                                                 |
|            Instructions retired                                              |
|     :ANY_P                                                                   |
|            Number of instructions retired                                    |
|     :PREC_DIST                                                               |
|            Precise instruction retired event to reduce effect of PEBS shadow |
|            IP distribution (Precise Event)                                   |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| INSTRUCTION_RETIRED                                                          |
|            Number of instructions at retirement                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| INSTRUCTIONS_RETIRED                                                         |
|            This is an alias for INSTRUCTION_RETIRED                          |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| INT_MISC                                                                     |
|            Miscellaneous internals                                           |
|     :RAT_STALL_CYCLES                                                        |
|            Cycles RAT external stall is sent to IDQ for this thread          |
|     :RECOVERY_CYCLES                                                         |
|            Cycles waiting to be recovered after Machine Clears due to all oth|
|            er cases except JEClear                                           |
|     :RECOVERY_STALLS_COUNT                                                   |
|            Number of times need to wait after Machine Clears due to all other|
|             cases except JEClear                                             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ITLB                                                                         |
|            Instruction TLB                                                   |
|     :ITLB_FLUSH                                                              |
|            Number of ITLB flushes, includes 4k/2M/4M pages                   |
|     :FLUSH                                                                   |
|            Number of ITLB flushes, includes 4k/2M/4M pages                   |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ITLB_MISSES                                                                  |
|            Instruction TLB misses                                            |
|     :MISS_CAUSES_A_WALK                                                      |
|            Miss in all TLB levels that causes a page walk of any page size (4|
|            K/2M/4M/1G)                                                       |
|     :CAUSES_A_WALK                                                           |
|            Miss in all TLB levels that causes a page walk of any page size (4|
|            K/2M/4M/1G)                                                       |
|     :STLB_HIT                                                                |
|            First level miss but second level hit; no page walk. Only relevant|
|             if multiple levels                                               |
|     :WALK_COMPLETED                                                          |
|            Miss in all TLB levels that causes a page walk that completes of a|
|            ny page size (4K/2M/4M/1G)                                        |
|     :WALK_DURATION                                                           |
|            Cycles PMH is busy with this walk                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L1D                                                                          |
|            L1D cache                                                         |
|     :ALLOCATED_IN_M                                                          |
|            Number of allocations of L1D cache lines in modified (M) state    |
|     :ALL_M_REPLACEMENT                                                       |
|            Number of cache lines in M-state evicted of L1D due to snoop HITM |
|            or dirty line replacement                                         |
|     :M_EVICT                                                                 |
|            Number of modified lines evicted from L1D due to replacement      |
|     :REPLACEMENT                                                             |
|            Number of cache lines brought into the L1D cache                  |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L1D_BLOCKS                                                                   |
|            L1D is blocking                                                   |
|     :BANK_CONFLICT                                                           |
|            Number of dispatched loads cancelled due to L1D bank conflicts wit|
|            h other load ports                                                |
|     :BANK_CONFLICT_CYCLES                                                    |
|            Cycles with l1d blocks due to bank conflicts                      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L1D_PEND_MISS                                                                |
|            L1D pending misses                                                |
|     :OCCURRENCES                                                             |
|            Occurrences of L1D_PEND_MISS going active                         |
|     :EDGE                                                                    |
|            Occurrences of L1D_PEND_MISS going active                         |
|     :PENDING                                                                 |
|            Number of L1D load misses outstanding every cycle                 |
|     :PENDING_CYCLES                                                          |
|            Cycles with L1D load misses outstanding                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_L1D_WB_RQSTS                                                              |
|            Writeback requests from L1D to L2                                 |
|     :HIT_E                                                                   |
|            Non rejected writebacks from L1D to L2 cache lines in E state     |
|     :HIT_M                                                                   |
|            Non rejected writebacks from L1D to L2 cache lines in M state     |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_LINES_IN                                                                  |
|            L2 lines alloacated                                               |
|     :ANY                                                                     |
|            L2 cache lines filling (counting does not cover rejects)          |
|     :E                                                                       |
|            L2 cache lines in E state (counting does not cover rejects)       |
|     :I                                                                       |
|            L2 cache lines in I state (counting does not cover rejects)       |
|     :S                                                                       |
|            L2 cache lines in S state (counting does not cover rejects)       |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_LINES_OUT                                                                 |
|            L2 lines evicted                                                  |
|     :DEMAND_CLEAN                                                            |
|            L2 clean line evicted by a demand                                 |
|     :DEMAND_DIRTY                                                            |
|            L2 dirty line evicted by a demand                                 |
|     :PREFETCH_CLEAN                                                          |
|            L2 clean line evicted by a prefetch                               |
|     :PREFETCH_DIRTY                                                          |
|            L2 dirty line evicted by an MLC Prefetch                          |
|     :DIRTY_ANY                                                               |
|            Any L2 dirty line evicted (does not cover rejects)                |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_RQSTS                                                                     |
|            L2 requests                                                       |
|     :ALL_CODE_RD                                                             |
|            Any ifetch request to L2 cache                                    |
|     :CODE_RD_HIT                                                             |
|            L2 cache hits when fetching instructions                          |
|     :CODE_RD_MISS                                                            |
|            L2 cache misses when fetching instructions                        |
|     :ALL_DEMAND_DATA_RD                                                      |
|            Demand  data read requests to L2 cache                            |
|     :ALL_DEMAND_RD_HIT                                                       |
|            Demand data read requests that hit L2                             |
|     :ALL_PF                                                                  |
|            Any L2 HW prefetch request to L2 cache                            |
|     :PF_HIT                                                                  |
|            Requests from the L2 hardware prefetchers that hit L2 cache       |
|     :PF_MISS                                                                 |
|            Requests from the L2 hardware prefetchers that miss L2 cache      |
|     :RFO_ANY                                                                 |
|            Any RFO requests to L2 cache                                      |
|     :RFO_HITS                                                                |
|            RFO requests that hit L2 cache                                    |
|     :RFO_MISS                                                                |
|            RFO requests that miss L2 cache                                   |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_STORE_LOCK_RQSTS                                                          |
|            L2 store lock requests                                            |
|     :HIT_E                                                                   |
|            RFOs that hit cache lines in E state                              |
|     :MISS                                                                    |
|            RFOs that miss cache (I state)                                    |
|     :HIT_M                                                                   |
|            RFOs that hit cache lines in M state                              |
|     :ALL                                                                     |
|            RFOs that access cache lines in any state                         |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L2_TRANS                                                                     |
|            L2 transactions                                                   |
|     :ALL                                                                     |
|            Transactions accessing MLC pipe                                   |
|     :CODE_RD                                                                 |
|            L2 cache accesses when fetching instructions                      |
|     :L1D_WB                                                                  |
|            L1D writebacks that access L2 cache                               |
|     :LOAD                                                                    |
|            Demand Data Read* requests that access L2 cache                   |
|     :L2_FILL                                                                 |
|            L2 fill requests that access L2 cache                             |
|     :L2_WB                                                                   |
|            L2 writebacks that access L2 cache                                |
|     :ALL_PREFETCH                                                            |
|            L2 or L3 HW prefetches that access L2 cache (including rejects)   |
|     :RFO                                                                     |
|            RFO requests that access L2 cache                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LAST_LEVEL_CACHE_MISSES                                                      |
|            This is an alias for L3_LAT_CACHE:MISS                            |
|     :e=0                                                                     |
|            MISS, masks:edge level (may require counter-mask >= 1)            |
|     :i=0                                                                     |
|            MISS, masks:invert                                                |
|     :c=0                                                                     |
|            MISS, masks:counter-mask in range [0-255]                         |
|     :t=0                                                                     |
|            MISS, masks:measure any thread                                    |
|     :u=0                                                                     |
|            MISS, masks:monitor at user level                                 |
|     :k=0                                                                     |
|            MISS, masks:monitor at kernel level                               |
--------------------------------------------------------------------------------
| LLC_MISSES                                                                   |
|            Alias for LAST_LEVEL_CACHE_MISSES                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LAST_LEVEL_CACHE_REFERENCES                                                  |
|            This is an alias for L3_LAT_CACHE:REFERENCE                       |
|     :e=0                                                                     |
|            REFERENCE, masks:edge level (may require counter-mask >= 1)       |
|     :i=0                                                                     |
|            REFERENCE, masks:invert                                           |
|     :c=0                                                                     |
|            REFERENCE, masks:counter-mask in range [0-255]                    |
|     :t=0                                                                     |
|            REFERENCE, masks:measure any thread                               |
|     :u=0                                                                     |
|            REFERENCE, masks:monitor at user level                            |
|     :k=0                                                                     |
|            REFERENCE, masks:monitor at kernel level                          |
--------------------------------------------------------------------------------
| LLC_REFERENCES                                                               |
|            Alias for LAST_LEVEL_CACHE_REFERENCES                             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LD_BLOCKS                                                                    |
|            Blocking loads                                                    |
|     :DATA_UNKNOWN                                                            |
|            Blocked loads due to store buffer blocks with unknown data        |
|     :STORE_FORWARD                                                           |
|            Loads blocked by overlapping with store buffer that cannot be forw|
|            arded                                                             |
|     :NO_SR                                                                   |
|            Number of split loads blocked due to resource not available       |
|     :ALL_BLOCK                                                               |
|            Number of cases where any load is blocked but has not DCU miss    |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LD_BLOCKS_PARTIAL                                                            |
|            Partial load blocks                                               |
|     :ADDRESS_ALIAS                                                           |
|            False dependencies in MOB due to partial compare on address       |
|     :ALL_STA_BLOCK                                                           |
|            Number of times that load operations are temporarily blocked becau|
|            se of older stores, with addresses that are not yet known. A load |
|            operation may incur more than one block of this type              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| LOAD_HIT_PRE                                                                 |
|            Load dispatches that hit fill buffer                              |
|     :HW_PF                                                                   |
|            Non sw-prefetch load dispatches that hit the fill buffer allocated|
|             for HW prefetch                                                  |
|     :SW_PF                                                                   |
|            Non sw-prefetch load dispatches that hit the fill buffer allocated|
|             for SW prefetch                                                  |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| L3_LAT_CACHE                                                                 |
|            Core-originated cacheable demand requests to L3                   |
|     :MISS                                                                    |
|            Core-originated cacheable demand requests missed L3               |
|     :REFERENCE                                                               |
|            Core-originated cacheable demand requests that refer to L3        |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MACHINE_CLEARS                                                               |
|            Machine clear asserted                                            |
|     :MASKMOV                                                                 |
|            The number of executed Intel AVX masked load operations that refer|
|             to an illegal address range with the mask bits set to 0          |
|     :MEMORY_ORDERING                                                         |
|            Number of Memory Ordering Machine Clears detected                 |
|     :SMC                                                                     |
|            Self-Modifying Code detected                                      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_UOPS_LLC_HIT_RETIRED                                                |
|            Load uops retired which hit the L3 cache                          |
|     :XSNP_HIT                                                                |
|            Load LLC Hit and a cross-core Snoop hits in on-pkg core cache (Pre|
|            cise Event)                                                       |
|     :XSNP_HITM                                                               |
|            Load had HitM Response from a core on same socket (shared LLC) (Pr|
|            ecise Event)                                                      |
|     :XSNP_MISS                                                               |
|            Load LLC Hit and a cross-core Snoop missed in on-pkg core cache (P|
|            recise Event)                                                     |
|     :XSNP_NONE                                                               |
|            Load hit in last-level (L3) cache with no snoop needed (Precise Ev|
|            ent)                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_LLC_HIT_RETIRED                                                     |
|            Load uops retired which hit the L3 cache                          |
|     :XSNP_HIT                                                                |
|            Load LLC Hit and a cross-core Snoop hits in on-pkg core cache (Pre|
|            cise Event)                                                       |
|     :XSNP_HITM                                                               |
|            Load had HitM Response from a core on same socket (shared LLC) (Pr|
|            ecise Event)                                                      |
|     :XSNP_MISS                                                               |
|            Load LLC Hit and a cross-core Snoop missed in on-pkg core cache (P|
|            recise Event)                                                     |
|     :XSNP_NONE                                                               |
|            Load hit in last-level (L3) cache with no snoop needed (Precise Ev|
|            ent)                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_UOPS_LLC_MISS_RETIRED                                               |
|            Load uops retired which miss the L3 cache                         |
|     :LOCAL_DRAM                                                              |
|            Load uops that miss in the L3 and hit local DRAM                  |
|     :REMOTE_DRAM                                                             |
|            Load uops that miss in the L3 and hit remote DRAM                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_UOPS_MISC_RETIRED                                                   |
|            Loads and some non simd split loads uops retired                  |
|     :LLC_MISS                                                                |
|            Counts load driven L3 misses and some non simd split loads (Precis|
|            e Event)                                                          |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_MISC_RETIRED                                                        |
|            Loads and some non simd split loads uops retired (deprecated use M|
|            EM_LOAD_UOPS_MISC_RETIRED)                                        |
|     :LLC_MISS                                                                |
|            Counts load driven L3 misses and some non simd split loads (Precis|
|            e Event)                                                          |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_UOPS_RETIRED                                                        |
|            Memory loads uops retired                                         |
|     :HIT_LFB                                                                 |
|            A load missed L1D but hit the Fill Buffer (Precise Event)         |
|     :L1_HIT                                                                  |
|            Load hit in nearest-level (L1D) cache (Precise Event)             |
|     :L2_HIT                                                                  |
|            Load hit in mid-level (L2) cache (Precise Event)                  |
|     :L3_HIT                                                                  |
|            Load hit in last-level (L3) cache with no snoop needed (Precise Ev|
|            ent)                                                              |
|     :L3_MISS                                                                 |
|            Retired load uops which data sources were data missed LLC (excludi|
|            ng unknown data source)                                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_LOAD_RETIRED                                                             |
|            Memory loads uops retired (deprecated use MEM_LOAD_UOPS_RETIRED)  |
|     :HIT_LFB                                                                 |
|            A load missed L1D but hit the Fill Buffer (Precise Event)         |
|     :L1_HIT                                                                  |
|            Load hit in nearest-level (L1D) cache (Precise Event)             |
|     :L2_HIT                                                                  |
|            Load hit in mid-level (L2) cache (Precise Event)                  |
|     :L3_HIT                                                                  |
|            Load hit in last-level (L3) cache with no snoop needed (Precise Ev|
|            ent)                                                              |
|     :L3_MISS                                                                 |
|            Retired load uops which data sources were data missed LLC (excludi|
|            ng unknown data source)                                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_TRANS_RETIRED                                                            |
|            Memory transactions retired                                       |
|     :LATENCY_ABOVE_THRESHOLD                                                 |
|            Memory load instructions retired above programmed clocks, minimum |
|            value threshold is 4 (Precise Event required)                     |
|     :PRECISE_STORE                                                           |
|            Capture where stores occur, must use with PEBS (Precise Event requ|
|            ired)                                                             |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
--------------------------------------------------------------------------------
| MEM_UOPS_RETIRED                                                             |
|            Memory uops retired                                               |
|     :ALL_LOADS                                                               |
|            Any retired loads (Precise Event)                                 |
|     :ANY_LOADS                                                               |
|            Any retired loads (Precise Event)                                 |
|     :ALL_STORES                                                              |
|            Any retired stores (Precise Event)                                |
|     :ANY_STORES                                                              |
|            Any retired stores (Precise Event)                                |
|     :LOCK_LOADS                                                              |
|            Locked retired loads (Precise Event)                              |
|     :LOCK_STORES                                                             |
|            Locked retired stores (Precise Event)                             |
|     :SPLIT_LOADS                                                             |
|            Retired loads causing cacheline splits (Precise Event)            |
|     :SPLIT_STORES                                                            |
|            Retired stores causing cacheline splits (Precise Event)           |
|     :STLB_MISS_LOADS                                                         |
|            STLB misses dues to retired loads (Precise Event)                 |
|     :STLB_MISS_STORES                                                        |
|            STLB misses dues to retired stores (Precise Event)                |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MEM_UOP_RETIRED                                                              |
|            Memory uops retired (deprecated use MEM_UOPS_RETIRED)             |
|     :ALL_LOADS                                                               |
|            Any retired loads (Precise Event)                                 |
|     :ANY_LOADS                                                               |
|            Any retired loads (Precise Event)                                 |
|     :ALL_STORES                                                              |
|            Any retired stores (Precise Event)                                |
|     :ANY_STORES                                                              |
|            Any retired stores (Precise Event)                                |
|     :LOCK_LOADS                                                              |
|            Locked retired loads (Precise Event)                              |
|     :LOCK_STORES                                                             |
|            Locked retired stores (Precise Event)                             |
|     :SPLIT_LOADS                                                             |
|            Retired loads causing cacheline splits (Precise Event)            |
|     :SPLIT_STORES                                                            |
|            Retired stores causing cacheline splits (Precise Event)           |
|     :STLB_MISS_LOADS                                                         |
|            STLB misses dues to retired loads (Precise Event)                 |
|     :STLB_MISS_STORES                                                        |
|            STLB misses dues to retired stores (Precise Event)                |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| MISALIGN_MEM_REF                                                             |
|            Misaligned memory references                                      |
|     :LOADS                                                                   |
|            Speculative cache-line split load uops dispatched to the L1D      |
|     :STORES                                                                  |
|            Speculative cache-line split Store-address uops dispatched to L1D |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OFFCORE_REQUESTS                                                             |
|            Offcore requests                                                  |
|     :ALL_DATA_RD                                                             |
|            Demand and prefetch read requests sent to uncore                  |
|     :ALL_DATA_READ                                                           |
|            Demand and prefetch read requests sent to uncore                  |
|     :DEMAND_CODE_RD                                                          |
|            Offcore code read requests, including cacheable and un-cacheables |
|     :DEMAND_DATA_RD                                                          |
|            Demand Data Read requests sent to uncore                          |
|     :DEMAND_RFO                                                              |
|            Offcore Demand RFOs, includes regular RFO, Locks, ItoM            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OFFCORE_REQUESTS_BUFFER                                                      |
|            Offcore requests buffer                                           |
|     :SQ_FULL                                                                 |
|            Offcore requests buffer cannot take more entries for this thread c|
|            ore                                                               |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OFFCORE_REQUESTS_OUTSTANDING                                                 |
|            Outstanding offcore requests                                      |
|     :ALL_DATA_RD_CYCLES                                                      |
|            Cycles with cacheable data read transactions in the superQ        |
|     :DEMAND_CODE_RD_CYCLES                                                   |
|            Cycles with demand code reads transactions in the superQ          |
|     :DEMAND_DATA_RD_CYCLES                                                   |
|            Cycles with demand data read transactions in the superQ           |
|     :ALL_DATA_RD                                                             |
|            Cacheable data read transactions in the superQ every cycle        |
|     :DEMAND_CODE_RD                                                          |
|            Code read transactions in the superQ every cycle                  |
|     :DEMAND_DATA_RD                                                          |
|            Demand data read transactions in the superQ every cycle           |
|     :DEMAND_RFO                                                              |
|            Outstanding RFO (store) transactions in the superQ every cycle    |
|     :DEMAND_RFO_CYCLES                                                       |
|            Cycles with outstanding RFO (store) transactions in the superQ    |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OTHER_ASSISTS                                                                |
|            Count hardware assists                                            |
|     :ITLB_MISS_RETIRED                                                       |
|            Number of instructions that experienced an ITLB miss              |
|     :AVX_TO_SSE                                                              |
|            Number of transitions from AVX-256 to legacy SSE when penalty appl|
|            icable                                                            |
|     :SSE_TO_AVX                                                              |
|            Number of transitions from legacy SSE to AVX-256 when penalty appl|
|            icable                                                            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| PARTIAL_RAT_STALLS                                                           |
|            Partial Register Allocation Table stalls                          |
|     :FLAGS_MERGE_UOP                                                         |
|            Number of flags-merge uops in flight in each cycle                |
|     :CYCLES_FLAGS_MERGE_UOP                                                  |
|            Cycles in which flags-merge uops in flight                        |
|     :MUL_SINGLE_UOP                                                          |
|            Number of Multiply packed/scalar single precision uops allocated  |
|     :SLOW_LEA_WINDOW                                                         |
|            Number of cycles with at least one slow LEA uop allocated         |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| RESOURCE_STALLS                                                              |
|            Resource related stall cycles                                     |
|     :ANY                                                                     |
|            Cycles stalled due to Resource Related reason                     |
|     :LB                                                                      |
|            Cycles stalled due to lack of load buffers                        |
|     :RS                                                                      |
|            Cycles stalled due to no eligible RS entry available              |
|     :SB                                                                      |
|            Cycles stalled due to no store buffers available (not including dr|
|            aining from sync)                                                 |
|     :ROB                                                                     |
|            Cycles stalled due to re-order buffer full                        |
|     :FCSW                                                                    |
|            Cycles stalled due to writing the FPU control word                |
|     :MXCSR                                                                   |
|            Cycles stalled due to the MXCSR register ranme occurring too close|
|             to a previous MXCSR rename                                       |
|     :MEM_RS                                                                  |
|            Cycles stalled due to LB, SB or RS being completely in use        |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| RESOURCE_STALLS2                                                             |
|            Resource related stall cycles                                     |
|     :ALL_FL_EMPTY                                                            |
|            Cycles stalled due to free list empty                             |
|     :ALL_PRF_CONTROL                                                         |
|            Cycles stalls due to control structures full for physical register|
|            s                                                                 |
|     :ANY_PRF_CONTROL                                                         |
|            Cycles stalls due to control structures full for physical register|
|            s                                                                 |
|     :BOB_FULL                                                                |
|            Cycles Allocator is stalled due Branch Order Buffer               |
|     :OOO_RSRC                                                                |
|            Cycles stalled due to out of order resources full                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| ROB_MISC_EVENTS                                                              |
|            Reorder buffer events                                             |
|     :LBR_INSERTS                                                             |
|            Count each time an new LBR record is saved by HW                  |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| RS_EVENTS                                                                    |
|            Reservation station events                                        |
|     :EMPTY_CYCLES                                                            |
|            Cycles the RS is empty for this thread                            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| SIMD_FP_256                                                                  |
|            Counts 256-bit packed floating point instructions                 |
|     :PACKED_SINGLE                                                           |
|            Counts 256-bit packed single-precision                            |
|     :PACKED_DOUBLE                                                           |
|            Counts 256-bit packed double-precision                            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| SQ_MISC                                                                      |
|            SuperQ events                                                     |
|     :SPLIT_LOCK                                                              |
|            Split locks in SQ                                                 |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| TLB_FLUSH                                                                    |
|            TLB flushes                                                       |
|     :DTLB_THREAD                                                             |
|            Number of DTLB flushes of thread-specific entries                 |
|     :STLB_ANY                                                                |
|            Number of STLB flushes                                            |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UNHALTED_CORE_CYCLES                                                         |
|            Count core clock cycles whenever the clock signal on the specific |
|            core is running (not halted)                                      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UNHALTED_REFERENCE_CYCLES                                                    |
|            Unhalted reference cycles                                         |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UOPS_DISPATCHED                                                              |
|            Uops dispatched                                                   |
|     :CORE                                                                    |
|            Counts total number of uops dispatched from any thread            |
|     :STALL_CYCLES                                                            |
|            Counts number of cycles no uops were dispatched on this thread    |
|     :THREAD                                                                  |
|            Counts total number of uops to be dispatched per-thread each cycle|
|                                                                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UOPS_DISPATCHED_PORT                                                         |
|            Uops dispatch to specific ports                                   |
|     :PORT_0                                                                  |
|            Cycles which a Uop is dispatched on port 0                        |
|     :PORT_1                                                                  |
|            Cycles which a Uop is dispatched on port 1                        |
|     :PORT_2_LD                                                               |
|            Cycles in which a load uop is dispatched on port 2                |
|     :PORT_2_STA                                                              |
|            Cycles in which a store uop is dispatched on port 2               |
|     :PORT_2                                                                  |
|            Cycles in which a uop is dispatched on port 2                     |
|     :PORT_3_LD                                                               |
|            Cycles in which a load uop is disptached on port 3                |
|     :PORT_3_STA                                                              |
|            Cycles in which a store uop is disptached on port 3               |
|     :PORT_3                                                                  |
|            Cycles in which a uop is disptached on port 3                     |
|     :PORT_4                                                                  |
|            Cycles which a uop is dispatched on port 4                        |
|     :PORT_5                                                                  |
|            Cycles which a Uop is dispatched on port 5                        |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UOPS_ISSUED                                                                  |
|            Uops issued                                                       |
|     :ANY                                                                     |
|            Number of uops issued by the RAT to the Reservation Station (RS)  |
|     :CORE_STALL_CYCLES                                                       |
|            Cycles no uops issued on this core (by any thread)                |
|     :STALL_CYCLES                                                            |
|            Cycles no uops issued by this thread                              |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| UOPS_RETIRED                                                                 |
|            Uops retired                                                      |
|     :ALL                                                                     |
|            All uops that actually retired (Precise Event)                    |
|     :ANY                                                                     |
|            All uops that actually retired (Precise Event)                    |
|     :RETIRE_SLOTS                                                            |
|            Number of retirement slots used (Precise Event)                   |
|     :STALL_CYCLES                                                            |
|            Cycles no executable uop retired (Precise Event)                  |
|     :TOTAL_CYCLES                                                            |
|            Total cycles using precise uop retired event (Precise Event)      |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| CYCLE_ACTIVITY                                                               |
|            Stalled cycles                                                    |
|     :CYCLES_L2_PENDING                                                       |
|            Cycles with pending L2 miss loads                                 |
|     :CYCLES_L1D_PENDING                                                      |
|            Cycles with pending L1D load cache misses                         |
|     :CYCLES_NO_DISPATCH                                                      |
|            Cycles of dispatch stalls                                         |
|     :STALLS_L2_PENDING                                                       |
|            Execution stalls due to L2 pending loads                          |
|     :STALLS_L1D_PENDING                                                      |
|            Execution stalls due to L1D pending loads                         |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OFFCORE_RESPONSE_0                                                           |
|            Offcore response event (must provide at least one request type and|
|             either any_response or any combination of supplier + snoop)      |
|     :DMND_DATA_RD                                                            |
|            Request: number of demand and DCU prefetch data reads of full and |
|            partial cachelines as well as demand data page table entry cacheli|
|            ne reads. Does not count L2 data read prefetches or instruction fe|
|            tches                                                             |
|     :DMND_RFO                                                                |
|            Request: number of demand and DCU prefetch reads for ownership (RF|
|            O) requests generated by a write to data cacheline. Does not count|
|             L2 RFO prefetches                                                |
|     :DMND_IFETCH                                                             |
|            Request: number of demand and DCU prefetch instruction cacheline r|
|            eads. Does not count L2 code read prefetches                      |
|     :WB                                                                      |
|            Request: number of writebacks (modified to exclusive) transactions|
|                                                                              |
|     :PF_DATA_RD                                                              |
|            Request: number of data cacheline reads generated by L2 prefetcher|
|            s                                                                 |
|     :PF_RFO                                                                  |
|            Request: number of RFO requests generated by L2 prefetchers       |
|     :PF_IFETCH                                                               |
|            Request: number of code reads generated by L2 prefetchers         |
|     :PF_LLC_DATA_RD                                                          |
|            Request: number of L3 prefetcher requests to L2 for loads         |
|     :PF_LLC_RFO                                                              |
|            Request: number of RFO requests generated by L2 prefetcher        |
|     :PF_LLC_IFETCH                                                           |
|            Request: number of L2 prefetcher requests to L3 for instruction fe|
|            tches                                                             |
|     :BUS_LOCKS                                                               |
|            Request: number bus lock and split lock requests                  |
|     :STRM_ST                                                                 |
|            Request: number of streaming store requests                       |
|     :OTHER                                                                   |
|            Request: counts one of the following transaction types, including |
|            L3 invalidate, I/O, full or partial writes, WC or non-temporal sto|
|            res, CLFLUSH, Fences, lock, unlock, split lock                    |
|     :ANY_IFETCH                                                              |
|            Request: combination of PF_IFETCH | DMND_IFETCH | PF_LLC_IFETCH   |
|     :ANY_REQUEST                                                             |
|            Request: combination of all request umasks                        |
|     :ANY_DATA                                                                |
|            Request: combination of DMND_DATA | PF_DATA_RD | PF_LLC_DATA_RD   |
|     :ANY_RFO                                                                 |
|            Request: combination of DMND_RFO | PF_RFO | PF_LLC_RFO            |
|     :ANY_RESPONSE                                                            |
|            Response: count any response type                                 |
|     :NO_SUPP                                                                 |
|            Supplier: counts number of times supplier information is not avail|
|            able                                                              |
|     :LLC_HITM                                                                |
|            Supplier: counts L3 hits in M-state (initial lookup)              |
|     :LLC_HITE                                                                |
|            Supplier: counts L3 hits in E-state                               |
|     :LLC_HITS                                                                |
|            Supplier: counts L3 hits in S-state                               |
|     :LLC_HITF                                                                |
|            Supplier: counts L3 hits in F-state                               |
|     :LLC_MISS_LOCAL                                                          |
|            Supplier: counts L3 misses to local DRAM                          |
|     :LLC_MISS_LOCAL_DRAM                                                     |
|            Supplier: counts L3 misses to local DRAM                          |
|     :LLC_MISS_REMOTE                                                         |
|            Supplier: counts L3 misses to remote DRAM                         |
|     :LLC_MISS_REMOTE_DRAM                                                    |
|            Supplier: counts L3 misses to remote DRAM                         |
|     :LLC_HITMESF                                                             |
|            Supplier: counts L3 hits in any state (M, E, S, F)                |
|     :SNP_NONE                                                                |
|            Snoop: counts number of times no snoop-related information is avai|
|            lable                                                             |
|     :SNP_NOT_NEEDED                                                          |
|            Snoop: counts the number of times no snoop was needed to satisfy t|
|            he request                                                        |
|     :SNP_MISS                                                                |
|            Snoop: counts number of times a snoop was needed and it missed all|
|             snooped caches                                                   |
|     :SNP_NO_FWD                                                              |
|            Snoop: counts number of times a snoop was needed and it hit in at |
|            leas one snooped cache                                            |
|     :SNP_FWD                                                                 |
|            Snoop: counts number of times a snoop was needed and data was forw|
|            arded from a remote socket                                        |
|     :HITM                                                                    |
|            Snoop: counts number of times a snoop was needed and it hitM-ed in|
|             local or remote cache                                            |
|     :NON_DRAM                                                                |
|            Snoop:  counts number of times target was a non-DRAM system addres|
|            s. This includes MMIO transactions                                |
|     :SNP_ANY                                                                 |
|            Snoop: any snoop reason                                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------
| OFFCORE_RESPONSE_1                                                           |
|            Offcore response event (must provide at least one request type and|
|             either any_response or any combination of supplier + snoop)      |
|     :DMND_DATA_RD                                                            |
|            Request: number of demand and DCU prefetch data reads of full and |
|            partial cachelines as well as demand data page table entry cacheli|
|            ne reads. Does not count L2 data read prefetches or instruction fe|
|            tches                                                             |
|     :DMND_RFO                                                                |
|            Request: number of demand and DCU prefetch reads for ownership (RF|
|            O) requests generated by a write to data cacheline. Does not count|
|             L2 RFO prefetches                                                |
|     :DMND_IFETCH                                                             |
|            Request: number of demand and DCU prefetch instruction cacheline r|
|            eads. Does not count L2 code read prefetches                      |
|     :WB                                                                      |
|            Request: number of writebacks (modified to exclusive) transactions|
|                                                                              |
|     :PF_DATA_RD                                                              |
|            Request: number of data cacheline reads generated by L2 prefetcher|
|            s                                                                 |
|     :PF_RFO                                                                  |
|            Request: number of RFO requests generated by L2 prefetchers       |
|     :PF_IFETCH                                                               |
|            Request: number of code reads generated by L2 prefetchers         |
|     :PF_LLC_DATA_RD                                                          |
|            Request: number of L3 prefetcher requests to L2 for loads         |
|     :PF_LLC_RFO                                                              |
|            Request: number of RFO requests generated by L2 prefetcher        |
|     :PF_LLC_IFETCH                                                           |
|            Request: number of L2 prefetcher requests to L3 for instruction fe|
|            tches                                                             |
|     :BUS_LOCKS                                                               |
|            Request: number bus lock and split lock requests                  |
|     :STRM_ST                                                                 |
|            Request: number of streaming store requests                       |
|     :OTHER                                                                   |
|            Request: counts one of the following transaction types, including |
|            L3 invalidate, I/O, full or partial writes, WC or non-temporal sto|
|            res, CLFLUSH, Fences, lock, unlock, split lock                    |
|     :ANY_IFETCH                                                              |
|            Request: combination of PF_IFETCH | DMND_IFETCH | PF_LLC_IFETCH   |
|     :ANY_REQUEST                                                             |
|            Request: combination of all request umasks                        |
|     :ANY_DATA                                                                |
|            Request: combination of DMND_DATA | PF_DATA_RD | PF_LLC_DATA_RD   |
|     :ANY_RFO                                                                 |
|            Request: combination of DMND_RFO | PF_RFO | PF_LLC_RFO            |
|     :ANY_RESPONSE                                                            |
|            Response: count any response type                                 |
|     :NO_SUPP                                                                 |
|            Supplier: counts number of times supplier information is not avail|
|            able                                                              |
|     :LLC_HITM                                                                |
|            Supplier: counts L3 hits in M-state (initial lookup)              |
|     :LLC_HITE                                                                |
|            Supplier: counts L3 hits in E-state                               |
|     :LLC_HITS                                                                |
|            Supplier: counts L3 hits in S-state                               |
|     :LLC_HITF                                                                |
|            Supplier: counts L3 hits in F-state                               |
|     :LLC_MISS_LOCAL                                                          |
|            Supplier: counts L3 misses to local DRAM                          |
|     :LLC_MISS_LOCAL_DRAM                                                     |
|            Supplier: counts L3 misses to local DRAM                          |
|     :LLC_MISS_REMOTE                                                         |
|            Supplier: counts L3 misses to remote DRAM                         |
|     :LLC_MISS_REMOTE_DRAM                                                    |
|            Supplier: counts L3 misses to remote DRAM                         |
|     :LLC_HITMESF                                                             |
|            Supplier: counts L3 hits in any state (M, E, S, F)                |
|     :SNP_NONE                                                                |
|            Snoop: counts number of times no snoop-related information is avai|
|            lable                                                             |
|     :SNP_NOT_NEEDED                                                          |
|            Snoop: counts the number of times no snoop was needed to satisfy t|
|            he request                                                        |
|     :SNP_MISS                                                                |
|            Snoop: counts number of times a snoop was needed and it missed all|
|             snooped caches                                                   |
|     :SNP_NO_FWD                                                              |
|            Snoop: counts number of times a snoop was needed and it hit in at |
|            leas one snooped cache                                            |
|     :SNP_FWD                                                                 |
|            Snoop: counts number of times a snoop was needed and data was forw|
|            arded from a remote socket                                        |
|     :HITM                                                                    |
|            Snoop: counts number of times a snoop was needed and it hitM-ed in|
|             local or remote cache                                            |
|     :NON_DRAM                                                                |
|            Snoop:  counts number of times target was a non-DRAM system addres|
|            s. This includes MMIO transactions                                |
|     :SNP_ANY                                                                 |
|            Snoop: any snoop reason                                           |
|     :e=0                                                                     |
|            edge level (may require counter-mask >= 1)                        |
|     :i=0                                                                     |
|            invert                                                            |
|     :c=0                                                                     |
|            counter-mask in range [0-255]                                     |
|     :t=0                                                                     |
|            measure any thread                                                |
|     :u=0                                                                     |
|            monitor at user level                                             |
|     :k=0                                                                     |
|            monitor at kernel level                                           |
--------------------------------------------------------------------------------

Total events reported: 186
native_avail.c                       PASSED
