Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3922451064
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509428; cv=none; b=NT0fl4Lh0HXEo9krwkzEaePSFC5NICIBiFB4kcLEc2jXTQ0zCBSmnifo8pmPWthOJmB11ob9vutTSVlzPHVCzDzqxbWCSNZFzebpH69lnPZq1TwucN6e/rbGkXPcJwu4HuHinqMMxSpdxjEVQQWmmN+CCopF8xF58Xvwds8c9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509428; c=relaxed/simple;
	bh=yai8fvHbNwxc6DSm030dj25Ca1icSaqoHK0QsWQvj6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvh5qF7cLpOb0ypAyLHzgDuxY46+qb72WT0J/WFUWJTBhn/+3jYlvu1qIKBwjibmZE2TJDPbF3c9vO23EkKPJq9GQ44AG14GLC6TRoutT1ZyGMTGOAoqTIKHv5Sex26ijg3w/9yHFyjei0usQvNM53layg2TC8jTyWu4gSrA8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jwbLgnvY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jwbLgnvY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so620858f8f.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509423; x=1784114223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMB6P73SsfBfiyWKQ5gXgesQzDuCeOYPOfzg0YS7ba4=;
        b=jwbLgnvYar5kVOjL5x1EEj4Yzj6ly5qsxBsQ19ILus9AbjcjNaUXWb5GAyu0qxEUq3
         00NQFkXwGyLT49SwAN7YJYzyQKXiAlTpEtZsW75BmjgUMB3YIZ8yMkWmWmkLgR79AeBs
         RQ4+13qaQS75x5C3lTdrH4f/3J2Ppb+UpnlsivDQqU9v/7y6KKIWfZRWTJ8PPTOIKfXJ
         s7v2lEdp9oakn4EGlAhn64FYMz3YMdqXcGCXZ2T8O6us7J5/mgIdm0A+HfRYBabzeye9
         uNfxkHGt/7Nq8k/A0+JHLbZK4cUn8DWEP3ObW3n76g9NpKWcq56NS4v4h5UQNjUYWzHD
         gcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509423; x=1784114223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMB6P73SsfBfiyWKQ5gXgesQzDuCeOYPOfzg0YS7ba4=;
        b=jWZy+gupnyiDplXOUJL7ysvle76uXtRYDlZHilER+OQZPTaEhj8nOS3US4ynnAAMKV
         2+RrdvKk8BFPTcDRycMBdUCsEBErE3yC/aYNwu+gVkhQ8SDeBQubWhiqMVbQryOwf3Zd
         EOh7G1DMYQwPFZOwGI/7xWWiRW5/M7dGadiDpmD9cOo+0A0lK5F2lyRi0p9EYN2iU1CA
         7I4LTd2DbViPtPhc4hGIhSOdG+XWyXJojDo4CS7NZbWKNbuRNh/HCP5Vj1adJSyb1s2L
         rlCDZ3MONyZ4g+sPvR0CQVF6KW3XIqVsjkPtKTAeF6xyF8iI2QIHSrVvF8bKfG2CKVuR
         uWuA==
X-Gm-Message-State: AOJu0Yw+ZCaTvaw4zT9pMKmmh2YsmaJUnFrx+y/0tLEN3KABcPxNm799
	Af2wGt5231AQAF6bzykc8rK3nM11aK/TchloqhmToiKXrtv9ZX2zHtVppQBrIfdHnns=
X-Gm-Gg: AfdE7ckrLOmWeDRmjwFb2EYS9FZIXxfHTLGsMMtt25wBWbCUZm+/lP0j96weW2XrQ1X
	H7X05bKKwLrhJNn6IQtSEWCv0F7HulP08i864kA048X6AqNnwcun1CPguRK77hbFyakgkuBZWsa
	VlZKy9vTcOOMMcWpkyRagJxix7E33D6JR+UiS5XWeV9/PLfCsRqI4oXZbnHGymsmcQ9D/itaZZl
	fzscPq2FFuU5naYCIsdzknAie7diCutw0Ihww5FfEy/WYeF+L4LzsGEMNx2KG6Gdq8Y89dJzxD0
	uKmd34meiNESug980NoA4jtR84nPpMuouyC+4YE5/NnDbYNJ6+q61qXEtkb1iKtc6nRQOmHMQPi
	kQ4eDpZ2Ak8zloDBVZLIWxpKj6/z8nvRA8BHd2MB1PEiV9JnP8E03y/SK6ZO35tXb+oS/mac3dy
	PdeF44xAmfxAr86Bnt9Y9BeRlrilWkQV1B4svn+jweCYIO/0YZ2Xau8t9IPK6RTE9iYy1CxCbl3
	tPj
X-Received: by 2002:a05:600c:a00d:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-493e68beea6mr21363025e9.24.1783509422901;
        Wed, 08 Jul 2026 04:17:02 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e5a572c3sm60793385e9.1.2026.07.08.04.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Wed,  8 Jul 2026 13:15:22 +0200
Message-ID:  <afa9a60627dcc211c8d975c6a90708d421ead8e5.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yai8fvHbNwxc6DSm030dj25Ca1icSaqoHK0QsWQvj6k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFvJsls1L+KgvHHZd1kR1DVFWMAkNJ97YCLp g6GlSAmV3eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xbwAKCRCPgPtYfRL+ Ts1NB/92txumDtVC8nyGI1EbAWyw4jTmLT6BHsLC8Q/OwZ9t/MKZS+RC2NRn8w+9RuhQ8ipabCb q4QHl+svDbgYODgD58ikTsNG9h7ITdnEgZLIPoQKh27sy6EwNPpq1EqpezV5aX7eLDaMz1awOw2 7dANKJuTQryRwuEfo6Y963x5+Hfy8AKuvD/ojrdzmmfRi1RFpc8LrBHyy+XrAl9fCO+7WPdzhk4 Y8UaG1WebXL0BohfWvPcg6VsltacLwgSbMVP9ZsLv5R88boosj1arUoxt4LbSdHh+nlx7BigTGz zlW25wZyQ55EYQE7cziDeNelpwJeCap0F02IDjdN3AbDx+c6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

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
2.55.0.11.g153666a7d9bb

