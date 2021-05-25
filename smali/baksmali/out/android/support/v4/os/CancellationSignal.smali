.class public final Landroid/support/v4/os/CancellationSignal;
.super Ljava/lang/Object;
.source "CancellationSignal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/os/CancellationSignal$OnCancelListener;
    }
.end annotation


# instance fields
.field private mCancelInProgress:Z

.field private mCancellationSignalObj:Ljava/lang/Object;

.field private mIsCanceled:Z

.field private mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private waitForCancelFinishedLocked()V
    .registers 2

    :goto_0
    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    if-eqz v0, :cond_a

    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_7} :catch_8

    goto :goto_0

    :catch_8
    nop

    goto :goto_0

    :cond_a
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    iput-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    iget-object v1, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_3e

    const/4 v2, 0x0

    if-eqz v0, :cond_1a

    :try_start_14
    invoke-interface {v0}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V

    goto :goto_1a

    :catchall_18
    move-exception v0

    goto :goto_28

    :cond_1a
    :goto_1a
    if-eqz v1, :cond_33

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v0, v3, :cond_33

    check-cast v1, Landroid/os/CancellationSignal;

    invoke-virtual {v1}, Landroid/os/CancellationSignal;->cancel()V
    :try_end_27
    .catchall {:try_start_14 .. :try_end_27} :catchall_18

    goto :goto_33

    :goto_28
    monitor-enter p0

    :try_start_29
    iput-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_29 .. :try_end_2f} :catchall_30

    throw v0

    :catchall_30
    move-exception v0

    :try_start_31
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v0

    :cond_33
    :goto_33
    monitor-enter p0

    :try_start_34
    iput-boolean v2, p0, Landroid/support/v4/os/CancellationSignal;->mCancelInProgress:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0

    return-void

    :catchall_3b
    move-exception v0

    monitor-exit p0
    :try_end_3d
    .catchall {:try_start_34 .. :try_end_3d} :catchall_3b

    throw v0

    :catchall_3e
    move-exception v0

    :try_start_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v0
.end method

.method public getCancellationSignalObject()Ljava/lang/Object;
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    monitor-enter p0

    :try_start_9
    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    if-nez v0, :cond_1f

    new-instance v0, Landroid/os/CancellationSignal;

    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    iput-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v0, :cond_1f

    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    check-cast v0, Landroid/os/CancellationSignal;

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_1f
    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mCancellationSignalObj:Ljava/lang/Object;

    monitor-exit p0

    return-object v0

    :catchall_23
    move-exception v0

    monitor-exit p0
    :try_end_25
    .catchall {:try_start_9 .. :try_end_25} :catchall_23

    throw v0
.end method

.method public isCanceled()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public setOnCancelListener(Landroid/support/v4/os/CancellationSignal$OnCancelListener;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Landroid/support/v4/os/CancellationSignal;->waitForCancelFinishedLocked()V

    iget-object v0, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    if-ne v0, p1, :cond_a

    monitor-exit p0

    return-void

    :cond_a
    iput-object p1, p0, Landroid/support/v4/os/CancellationSignal;->mOnCancelListener:Landroid/support/v4/os/CancellationSignal$OnCancelListener;

    iget-boolean v0, p0, Landroid/support/v4/os/CancellationSignal;->mIsCanceled:Z

    if-eqz v0, :cond_18

    if-nez p1, :cond_13

    goto :goto_18

    :cond_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_1a

    invoke-interface {p1}, Landroid/support/v4/os/CancellationSignal$OnCancelListener;->onCancel()V

    return-void

    :cond_18
    :goto_18
    :try_start_18
    monitor-exit p0

    return-void

    :catchall_1a
    move-exception p1

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_18 .. :try_end_1c} :catchall_1a

    throw p1
.end method

.method public throwIfCanceled()V
    .registers 2

    invoke-virtual {p0}, Landroid/support/v4/os/CancellationSignal;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/support/v4/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/support/v4/os/OperationCanceledException;-><init>()V

    throw v0
.end method
