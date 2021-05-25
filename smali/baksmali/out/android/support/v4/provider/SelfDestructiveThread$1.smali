.class Landroid/support/v4/provider/SelfDestructiveThread$1;
.super Ljava/lang/Object;
.source "SelfDestructiveThread.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/provider/SelfDestructiveThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/provider/SelfDestructiveThread;


# direct methods
.method constructor <init>(Landroid/support/v4/provider/SelfDestructiveThread;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/provider/SelfDestructiveThread$1;->this$0:Landroid/support/v4/provider/SelfDestructiveThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 4

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_18

    return v1

    :pswitch_7
    iget-object v0, p0, Landroid/support/v4/provider/SelfDestructiveThread$1;->this$0:Landroid/support/v4/provider/SelfDestructiveThread;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Runnable;

    invoke-virtual {v0, p1}, Landroid/support/v4/provider/SelfDestructiveThread;->onInvokeRunnable(Ljava/lang/Runnable;)V

    return v1

    :pswitch_11
    iget-object p1, p0, Landroid/support/v4/provider/SelfDestructiveThread$1;->this$0:Landroid/support/v4/provider/SelfDestructiveThread;

    invoke-virtual {p1}, Landroid/support/v4/provider/SelfDestructiveThread;->onDestruction()V

    return v1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_11
        :pswitch_7
    .end packed-switch
.end method
