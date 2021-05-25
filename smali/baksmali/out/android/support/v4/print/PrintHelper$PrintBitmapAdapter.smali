.class Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;
.super Landroid/print/PrintDocumentAdapter;
.source "PrintHelper.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/print/PrintHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PrintBitmapAdapter"
.end annotation


# instance fields
.field private mAttributes:Landroid/print/PrintAttributes;

.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mCallback:Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;

.field private final mFittingMode:I

.field private final mJobName:Ljava/lang/String;

.field final synthetic this$0:Landroid/support/v4/print/PrintHelper;


# direct methods
.method constructor <init>(Landroid/support/v4/print/PrintHelper;Ljava/lang/String;ILandroid/graphics/Bitmap;Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;)V
    .registers 6

    iput-object p1, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->this$0:Landroid/support/v4/print/PrintHelper;

    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    iput-object p2, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mJobName:Ljava/lang/String;

    iput p3, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mFittingMode:I

    iput-object p4, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mBitmap:Landroid/graphics/Bitmap;

    iput-object p5, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mCallback:Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;

    return-void
.end method


# virtual methods
.method public onFinish()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mCallback:Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mCallback:Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;

    invoke-interface {v0}, Landroid/support/v4/print/PrintHelper$OnPrintFinishCallback;->onFinish()V

    :cond_9
    return-void
.end method

.method public onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .registers 6

    iput-object p2, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mAttributes:Landroid/print/PrintAttributes;

    new-instance p3, Landroid/print/PrintDocumentInfo$Builder;

    iget-object p5, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mJobName:Ljava/lang/String;

    invoke-direct {p3, p5}, Landroid/print/PrintDocumentInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 p5, 0x1

    invoke-virtual {p3, p5}, Landroid/print/PrintDocumentInfo$Builder;->setContentType(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object p3

    invoke-virtual {p3, p5}, Landroid/print/PrintDocumentInfo$Builder;->setPageCount(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object p3

    invoke-virtual {p3}, Landroid/print/PrintDocumentInfo$Builder;->build()Landroid/print/PrintDocumentInfo;

    move-result-object p3

    invoke-virtual {p2, p1}, Landroid/print/PrintAttributes;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/2addr p1, p5

    invoke-virtual {p4, p3, p1}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V

    return-void
.end method

.method public onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .registers 12

    iget-object v0, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->this$0:Landroid/support/v4/print/PrintHelper;

    iget-object v1, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mAttributes:Landroid/print/PrintAttributes;

    iget v2, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mFittingMode:I

    iget-object v3, p0, Landroid/support/v4/print/PrintHelper$PrintBitmapAdapter;->mBitmap:Landroid/graphics/Bitmap;

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/print/PrintHelper;->writeBitmap(Landroid/print/PrintAttributes;ILandroid/graphics/Bitmap;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V

    return-void
.end method
