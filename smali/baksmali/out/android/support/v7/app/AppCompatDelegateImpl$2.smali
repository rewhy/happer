.class Landroid/support/v7/app/AppCompatDelegateImpl$2;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AppCompatDelegateImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/app/AppCompatDelegateImpl;


# direct methods
.method constructor <init>(Landroid/support/v7/app/AppCompatDelegateImpl;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    iget v0, v0, Landroid/support/v7/app/AppCompatDelegateImpl;->mInvalidatePanelMenuFeatures:I

    and-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AppCompatDelegateImpl;->doInvalidatePanelMenu(I)V

    :cond_e
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    iget v0, v0, Landroid/support/v7/app/AppCompatDelegateImpl;->mInvalidatePanelMenuFeatures:I

    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_1d

    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    const/16 v2, 0x6c

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AppCompatDelegateImpl;->doInvalidatePanelMenu(I)V

    :cond_1d
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    iput-boolean v1, v0, Landroid/support/v7/app/AppCompatDelegateImpl;->mInvalidatePanelMenuPosted:Z

    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImpl$2;->this$0:Landroid/support/v7/app/AppCompatDelegateImpl;

    iput v1, v0, Landroid/support/v7/app/AppCompatDelegateImpl;->mInvalidatePanelMenuFeatures:I

    return-void
.end method
