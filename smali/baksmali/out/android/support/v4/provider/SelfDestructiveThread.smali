.class public Landroid/support/v4/provider/SelfDestructiveThread;
.super Ljava/lang/Object;
.source "SelfDestructiveThread.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback;
    }
.end annotation


# static fields
.field private static final MSG_DESTRUCTION:I = 0x0

.field private static final MSG_INVOKE_RUNNABLE:I = 0x1


# instance fields
.field private mCallback:Landroid/os/Handler$Callback;

.field private final mDestructAfterMillisec:I

.field private mGeneration:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private final mPriority:I

.field private mThread:Landroid/os/HandlerThread;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mThreadName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    new-instance v0, Landroid/support/v4/provider/SelfDestructiveThread$1;

    invoke-direct {v0, p0}, Landroid/support/v4/provider/SelfDestructiveThread$1;-><init>(Landroid/support/v4/provider/SelfDestructiveThread;)V

    iput-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mCallback:Landroid/os/Handler$Callback;

    iput-object p1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThreadName:Ljava/lang/String;

    iput p2, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mPriority:I

    iput p3, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mDestructAfterMillisec:I

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mGeneration:I

    return-void
.end method

.method private post(Ljava/lang/Runnable;)V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    const/4 v2, 0x1

    if-nez v1, :cond_2c

    new-instance v1, Landroid/os/HandlerThread;

    iget-object v3, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThreadName:Ljava/lang/String;

    iget v4, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mPriority:I

    invoke-direct {v1, v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mCallback:Landroid/os/Handler$Callback;

    invoke-direct {v1, v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    iget v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mGeneration:I

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mGeneration:I

    :cond_2c
    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    monitor-exit v0

    return-void

    :catchall_3f
    move-exception p1

    monitor-exit v0
    :try_end_41
    .catchall {:try_start_3 .. :try_end_41} :catchall_3f

    throw p1
.end method


# virtual methods
.method public getGeneration()I
    .registers 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mGeneration:I

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public isRunning()Z
    .registers 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    if-eqz v1, :cond_9

    const/4 v1, 0x1

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    monitor-exit v0

    return v1

    :catchall_c
    move-exception v1

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v1
.end method

.method onDestruction()V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_e

    monitor-exit v0

    return-void

    :cond_e
    iget-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mThread:Landroid/os/HandlerThread;

    iput-object v1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    monitor-exit v0

    return-void

    :catchall_1a
    move-exception v1

    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v1
.end method

.method onInvokeRunnable(Ljava/lang/Runnable;)V
    .registers 6

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    iget-object p1, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_6
    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    iget v2, p0, Landroid/support/v4/provider/SelfDestructiveThread;->mDestructAfterMillisec:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    monitor-exit p1

    return-void

    :catchall_1c
    move-exception v0

    monitor-exit p1
    :try_end_1e
    .catchall {:try_start_6 .. :try_end_1e} :catchall_1c

    throw v0
.end method

.method public postAndReply(Ljava/util/concurrent/Callable;Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;",
            "Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback<",
            "TT;>;)V"
        }
    .end annotation

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Landroid/support/v4/provider/SelfDestructiveThread$2;

    invoke-direct {v1, p0, p1, v0, p2}, Landroid/support/v4/provider/SelfDestructiveThread$2;-><init>(Landroid/support/v4/provider/SelfDestructiveThread;Ljava/util/concurrent/Callable;Landroid/os/Handler;Landroid/support/v4/provider/SelfDestructiveThread$ReplyCallback;)V

    invoke-direct {p0, v1}, Landroid/support/v4/provider/SelfDestructiveThread;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method public postAndWait(Ljava/util/concurrent/Callable;I)Ljava/lang/Object;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;I)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    new-instance v7, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v7}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v8

    new-instance v9, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v9}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    new-instance v10, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x1

    invoke-direct {v10, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v11, Landroid/support/v4/provider/SelfDestructiveThread$3;

    move-object v0, v11

    move-object v1, p0

    move-object v2, v9

    move-object v3, p1

    move-object v4, v7

    move-object v5, v10

    move-object v6, v8

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/provider/SelfDestructiveThread$3;-><init>(Landroid/support/v4/provider/SelfDestructiveThread;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Callable;Ljava/util/concurrent/locks/ReentrantLock;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/locks/Condition;)V

    invoke-direct {p0, v11}, Landroid/support/v4/provider/SelfDestructiveThread;->post(Ljava/lang/Runnable;)V

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_26
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_34

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_30
    .catchall {:try_start_26 .. :try_end_30} :catchall_5d

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object p1

    :cond_34
    :try_start_34
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v0, p2

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_5d

    :goto_3b
    :try_start_3b
    invoke-interface {v8, p1, p2}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    move-result-wide v0
    :try_end_3f
    .catch Ljava/lang/InterruptedException; {:try_start_3b .. :try_end_3f} :catch_40
    .catchall {:try_start_3b .. :try_end_3f} :catchall_5d

    move-wide p1, v0

    :catch_40
    :try_start_40
    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_4e

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_4a
    .catchall {:try_start_40 .. :try_end_4a} :catchall_5d

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-object p1

    :cond_4e
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_55

    goto :goto_3b

    :cond_55
    :try_start_55
    new-instance p1, Ljava/lang/InterruptedException;

    const-string p2, "timeout"

    invoke-direct {p1, p2}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_5d
    .catchall {:try_start_55 .. :try_end_5d} :catchall_5d

    :catchall_5d
    move-exception p1

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p1
.end method
