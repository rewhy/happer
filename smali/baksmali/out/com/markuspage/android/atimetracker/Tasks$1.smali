.class Lcom/markuspage/android/atimetracker/Tasks$1;
.super Ljava/util/TimerTask;
.source "Tasks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/markuspage/android/atimetracker/Tasks;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/markuspage/android/atimetracker/Tasks;


# direct methods
.method constructor <init>(Lcom/markuspage/android/atimetracker/Tasks;)V
    .registers 2

    iput-object p1, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->running:Z
    invoke-static {v0}, Lcom/markuspage/android/atimetracker/Tasks;->access$000(Lcom/markuspage/android/atimetracker/Tasks;)Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->adapter:Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;
    invoke-static {v0}, Lcom/markuspage/android/atimetracker/Tasks;->access$100(Lcom/markuspage/android/atimetracker/Tasks;)Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Tasks$TaskAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # invokes: Lcom/markuspage/android/atimetracker/Tasks;->setTitle()V
    invoke-static {v0}, Lcom/markuspage/android/atimetracker/Tasks;->access$200(Lcom/markuspage/android/atimetracker/Tasks;)V

    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    invoke-virtual {v0}, Lcom/markuspage/android/atimetracker/Tasks;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidate()V

    :cond_1f
    iget-object v0, p0, Lcom/markuspage/android/atimetracker/Tasks$1;->this$0:Lcom/markuspage/android/atimetracker/Tasks;

    # getter for: Lcom/markuspage/android/atimetracker/Tasks;->timer:Landroid/os/Handler;
    invoke-static {v0}, Lcom/markuspage/android/atimetracker/Tasks;->access$300(Lcom/markuspage/android/atimetracker/Tasks;)Landroid/os/Handler;

    move-result-object v0

    const-wide/32 v1, 0xea60

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
