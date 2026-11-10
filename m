Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347786;
	b=VfBKgleQOJ9uCE8BQJ7vExKsvwRUqOlgYeagYdTcIrJrtWgx7MC9CfqaOz2KdVzsyXy5
	 Qu7sFremGnPZ9PHb6l7gupmG1NLF3R9+5oaxlx89ZaO1XGHsCjRGP6CfDY5s/Q+VwS87O
	 93Khd1xVcGBhiM2qNV5oDTq2iZy1IiBB8T9HuREvi9FVxAtzryrGTkjnvh+F7gjtyQOwE
	 Y7CsUuJr26VPCLGmvCvRZfp/yBr3++IjhNgPPFYiRvAYYLY45OD4rK118qZMgt1CwMrH7
	 1KNEXT6ACd9XYVlUoChSkqZCbOQXHyIpAOR7ePWc56PSkrb2gcDdAH9yRAw36hqeLow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
	b=YRvlboCRl8RtY9/DbM3SPcYti+Z5Tp6SwhUxqenKsdzeBgdikjhek9+nvkCoIjrCFzpp
	 99p8dIiM+rw7/jvBqUq9a+xRHiZdNrN8PH5FvQYy1G5wG7hPGyvSbJUPmdvXue5Cj2pzD
	 TuoXzpkA6lFS55FpHlNJtHHYPbHJB26O5+r8daAmxSCEvUHpWUdXmAjNPK5d2ouIyoRJU
	 mSF6XMpFVTHEgv4SzuUemgMse2PZP7+7RPyxTql58XN1VDTri3WFKTodEHq47WCObObWR
	 0fUiuh+WjrCvky+x2nntLPxam2gRxmLONmnJfDQ4Mq+KDop/23trD7Gt343l8jscUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKr2KAaK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004160A6F78
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2004160A6F78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eKr2KAaK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so21380145e9.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347784; x=1794952584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
        b=eKr2KAaKm1m5XCobrTuc+JUqLMaLKYy7Dqo3aQR8F7cqtpDt7z4gqifdLaCn3f6PJi
         417VQXx7Ey8Z6lMlUUnwiG2A9peFvoj0R+QmvX5BOcSJrdEH3QTmg4UPEST5IlkARuHq
         HGIYVOq1LbjVUAVqnFksT7jtMSI8fwmAzDBOod4faMRnBu8Pa+AypGaJ4ZIA2bgirvTI
         4QF/2QMLT1bZNNSU2GWuFh08+NjUyndKK8UwHgx0ZQVHVame0yi1kjKPqo8eXhowQp+O
         m2hr56QwFFioADpPiRHXhLY8B3Yp+DMfCVFA6EGg6NvmIgmlLAaktiLrMoBjBhVq2arI
         2Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347784; x=1794952584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nCrufOHdC0otKoL4oDb1v5VvTPC6lNZya3g3L1E/9c=;
        b=Zlx27hqSYjwrmI/mi7lDczOlxfhHMgBW0m3z7TSNUqtWYuEBojT6+Qez9ex9D+0DJf
         JQEyHyhlevynDXk/a6k9YV+NvxQNUgeEsy4TrbIXTY6pVJ9iSZ8X7EZPF9XGx0GEeKbW
         HtlC48D97UwHGZRCOYiI5eyBtntWdX9oab7Yih63bk71uKIE2ALmLvd53Si/D7hDf4IT
         qpyEV9vT5xWSfLV5vGHS8O6f+iTKQIzAtmMw0bDiscjmPdC0UPBxOBXZZPxUZdUA0feF
         PkSynY9WEet61tK2adHpaWMQgN4drWdiLWUkNVeA7FtFl+qZDL7Tsv9mHrLVKxBgsGXS
         51uA==
X-Gm-Message-State: APuU4Z8IlPA42ITmlPcEYokQ9+oOzIbtBiOXgIjgTJVSGywz9R7EhOXo
	rxF9AhQfaCmffsRufFOmDK/jmeaAtS/UNqind1D7U+VTEjjm9BcuVMlEXdR9SLKDeOY=
X-Gm-Gg: AYBFou1hJZE/WciVsl/fu+fVekqAJarHuUe+Do2AtGRi4ABxMUnzEdkR6SR8zhXCbII
	5P1IwrkgRirY2v+CqxrGmdiaOOuek+N/tEI3fu9OIkkzxBveEXidoz6GLP6ybyB6K+gXNgIjEUP
	ps7kltJeKEBEWSoT/mZJgTL5tBDCrmiudjFhJJVVFexxw143ydflWUAulpBgruuS8LdcZEHq1NR
	rvP/YVStiRMug1+9K3WLWJnvfvo5OCFsJwoS73STfAFqD6rnUydXfaWwZcOrNoMDEsSZAmFlLwA
	ioX4qjU+fBjOEZ7aIXaUgC99Epa4NgGCD8IKHw7YG9AfLOF4LSoh934hgK5D+m0YI8wUAlUF5NN
	qnXx0TtiHfxIFad3sKM49fiBPYLLHCENuwrEVvyi3uJ6aUvwGBQI+ZNg7mQ1ngh7GMmLFwdxULm
	CXpbqtQUWrlqPko1CiW6guL+G3Q+XfyJ8u8GUwGiqN2x63XAl1i25Wo9HWfVdJWFfI23u4tC/wz
	VTavYTWFvoBc17BGgu5Y3d01u65UwvM51dT6NwkHKsxYHJFxPnBRjV2A2KaNUC+bZCLSt2qMrk1
	S3pWdtzyktIzKzyHq4zAypXgP4OZ5uLAq98=
X-Received: by 2002:a05:600c:8b78:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba0939162dmr6430805e9.32.1794347784604;
        Tue, 10 Nov 2026 13:56:24 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4983600bd6esm7059540f8f.28.2026.11.10.13.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 14/20] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Tue, 10 Nov 2026 22:54:39 +0100
Message-ID:  <416bd01a3b26dccb675614634f3150175b754bef.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yt+7UEGDrCJb+BIynF/E91ZmXLZ0sqzooDjclRxhvN0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LFQrzzid/YWaj5O3c8VRgc7VwiNZn3Fxjrj gw4Aw6lhuiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSxQAKCRCPgPtYfRL+ ThBOB/9kBZN6cA2Pt8f3JhNFXDWhqb32kM+MWOdUKDTDwVaRi0u7X9Xqb3qbvBL8m0z6c96TaAW w/4x3K1hGnNmTAgTVvqDymBeIZsk1HmbDAZXOI/IoslA9bSalAADjlDsQF0Frt/FO7LR5bG+tnl vgnNzeCf681/Ww1+s/bdHgTvyKPsA97qH7b3Xp5arY9l8pf/7/QEEfQiUUN7SeDIV5amRBhCXAe cJDKmYzorM8AMt7vHsLO/WBL9Y/y0e/p8eu4BmSpkJ1n5KqVfcN+LecR57e7aW28rCACXsG+x4I SikqoOfR/GXWnVWXcf0X+s8umgV0Xha86y/38ThLItGvoK0F
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ioc3.c        |  2 +-
 drivers/mfd/janz-cmodio.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 5f8ac364b610..bf2be3bc8602 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -654,7 +654,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 }
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
-	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index add3bc04185b..93e1c04bddd6 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -259,12 +259,12 @@ static void cmodio_pci_remove(struct pci_dev *dev)
 
 /* The list of devices that this module will support */
 static const struct pci_device_id cmodio_pci_ids[] = {
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202 },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
-- 
2.56.0.rc1

