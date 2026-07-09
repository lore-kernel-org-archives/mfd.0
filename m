Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8FC43803C
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616429; cv=none; b=JkbCjo0TDz7H6EAolX9usczWzJTb8wC+hPNzsc1NMhteXwK/Q8Rprut12ibPeXw5pJE/mYvPbPEUUgb5qo1fBRkJs8lUtNpN3rnAierbzNw+az9KhaFYDur5JG0OtzTfwQMhNNbYNrbTZOVEAktIiAj/jzlJpLock4xtrjtv3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616429; c=relaxed/simple;
	bh=yai8fvHbNwxc6DSm030dj25Ca1icSaqoHK0QsWQvj6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7WjgPJx5Vo+wRQ2/Hma2M9QvW5ZXZgtPwAkKONQBHvjnRzUgQj7LTEeWqxCKlF/FeST2ppfyT1PQp1xLjlWxW4XmrMuDf+TVyHFUZnsLHbvwKqdmsIoZltJcM0RyZT9vGpyguM+Bcbv4pYfGlkPc1C5ZrxptFpVEw9X2jZfpaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PdaSooaH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PdaSooaH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso310875e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616427; x=1784221227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMB6P73SsfBfiyWKQ5gXgesQzDuCeOYPOfzg0YS7ba4=;
        b=PdaSooaHtoG+zEnZkv3EO7f9UG25LHViH2SsD1xAkam7E8enxC9H/Z+uhahkIgVhfh
         +vYS8JnCO3Hg0C6HvGEoCbyEw1BzomBgEUadl4XWsRI1VFgr1Ma5cpdJnxlcfsL/2EOK
         M80eraLIlVz6A4La8b4FGUCIUHC/qV9gOiG2JF5xrNxHH/fdM2VDmCPMUN7wKG5y4V5N
         vatZlESBFEyDcMw7KpTx7/YF4so7CWPSRVR3j/a1Ho2HwyV0zsTBRYSASHqtgB6UxzqP
         XWOM88BXgnP0en5Reu/EuAh4TXgP0HitSJKRKT/aM9GaCFkTyYzbXLYO8arH6kUNYab5
         kvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616427; x=1784221227;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMB6P73SsfBfiyWKQ5gXgesQzDuCeOYPOfzg0YS7ba4=;
        b=IPv0g+urQ8MR4wWZTGw8SbMYA6T3xeR8WT7BEYanpdqJ5zZE34i0uD1grKtCA/V9Vh
         iIJv9Rlcsrn0LTn6zhwMAWCFT6eH1nEdIASzBrwNt5zcmRUwlcCvehcwCGY9oEj1yILK
         GEAYhNA7p+0c3kUx6bzVoHfeQpH9VQBDseRPMOBddp0ANK7H5DXIWN4EDPA9vEK+gZKC
         8Zy3iKRr0DdvxHydbSgpkCQwNDBdlKz9OLy3fKbcvYYbEHP0i0ncHgt1tcTyogb2aKy3
         EgXMmSdr2GFDtqfxjsvWWjt2TYfDFkolEEGHej8ogwS5HzHIb0cxoWfNySKnEEHejtIW
         n4xg==
X-Gm-Message-State: AOJu0YwG0JIJs8mrafawTcLS9r6kRuDxM7AAp5I70GQYDQU0Iu+g2z3V
	X+L+l5el7ZBQVoSb+gNw3M10a+V+IHUi3sXEVsstRxICqbMUegL1R6QREIBiflcgB1A=
X-Gm-Gg: AfdE7cnHA23fyVFvHblJ7BXK7xD5cyrfYkolGwXVyL8zH5YgvNnpwXgz2JYfnNoErd/
	ww/v81oByakjq9kSToFVMKMru6i166wyM92vv0NoPbW3uB2to90sArivATd5A56C+D613A9f/oi
	MIeEP94FbrKXdHBir/zmEvuiwEQpgn/5P515mkbqZgdGPWFuUyvejeqZBloQM71mHYd01OAodg6
	Z+lgFTf9h2EtOSMgOB0NzgTJxHUFfhIN5QBTHQsWgdtnHZjie9QpqdtdYvu0lysl2Cw/TeGdlsa
	HENZivwAi6TESlRktRFT/pyn8Sj/YJ7Wbq2nEtCMzP9fj/2FFKLgbERbKHha/+qlzmYj/ngjFfB
	AfU7kH8XNRn8Hrzog6u8IPl9raWX4eV8beuDfGsGObxjaygQ5sBjrB8azDUFXgMbIylvirn2Ym+
	xwSyMgvR/RiwUZkOB6L0SBHMU3/8oKBP2yiiWU3VlC8E1BYQRaoQaNKHUQvF/0WSajyQCkdTIdm
	ePy57y5WG4ozC0=
X-Received: by 2002:a05:600c:6206:b0:493:c42c:7e87 with SMTP id 5b1f17b1804b1-493e68a0e71mr80314865e9.33.1783616426641;
        Thu, 09 Jul 2026 10:00:26 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6f3c42sm75470525e9.1.2026.07.09.10.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/23] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Thu,  9 Jul 2026 18:58:34 +0200
Message-ID:  <c62d0763911de7b0db60600e9649a8c1047b09f6.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2303; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yai8fvHbNwxc6DSm030dj25Ca1icSaqoHK0QsWQvj6k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NXWtUaT+GxepTHSu9rvs9EfTR253ckK7iOD vkPQXXyA5mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TVwAKCRCPgPtYfRL+ Tkk5B/0YFGmI0XHzfbT+RgN+znJR5pzJqNPftHCoPTBEAV6I5mJigzYp5WJ45ihQ8/+XT0vensI +/H4ULKeGlfZXLZK/mOZuxy1aREAWUK8X0stSU3zk98375o/nP6Ry0O+bn+dCMsESqdvbqovG3B Bh1TGhhhBiyQm4eEeK30Q6Fyi0gF5Se3VQwdHUsnaEY8C98T4zRmNjhdTSiKDjNleatW602S2eY /DIHihDrpni1e+XBa1vjMtI6keN/CldV+m2c03ueDpUIGRts/JbfiYF0jVfioMOisaVOFozOBSd fBg7hlg2RvVhzpbek/KMbPTEmosYMppibB38zO5yBWPuVwEJ
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

