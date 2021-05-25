.class public Landroid/support/v4/os/OperationCanceledException;
.super Ljava/lang/RuntimeException;
.source "OperationCanceledException.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v4/os/OperationCanceledException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    if-eqz p1, :cond_3

    goto :goto_5

    :cond_3
    const-string p1, "The operation has been canceled."

    :goto_5
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-void
.end method
