.class public final Landroid/support/v4/os/HandlerCompat;
.super Ljava/lang/Object;
.source "HandlerCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static postDelayed(Landroid/os/Handler;Ljava/lang/Runnable;Ljava/lang/Object;J)Z
    .registers 7
    .param p0    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    move-result p0

    return p0

    :cond_b
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    move-result-object p1

    iput-object p2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {p0, p1, p3, p4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result p0

    return p0
.end method
