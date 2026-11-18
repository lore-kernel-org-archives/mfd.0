Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989822;
	b=EM0XhE3cxFlsu26W5LHRF5PihHKwnFUCx+bE8V1HI2rDRKrOFyeVmMBhfmj3lZdiJXiz
	 tbxYjt3+i2SwmCl/nKPdGHL0WtYUKTnjzJI6a3lOoK1v6sZ+jVnVZdQDNkZd+MdLzscDV
	 50AsMfnZPglljWEj3u1gYtDwCBjKiDvSytq6FAVlZJqHGYABlxlFjPKfEz1UfEJupt2PU
	 r0OQykDX9+2+SIoML0tYPZqhZwzMshO/iO0RGqRRnItGgohTPG5ZuSjgO/icl2Jxf88C1
	 718hBzZiZ49iRbz/Njt6UOOSbgRypqdPiXK7hS1B+UWQL+HcCZrOHcpAH9E+2iPxCPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
	b=J9M9AjTXki0k+73XGN3hBKUVICtFGRyNzVdpEx6DX2vL3FOirLUFlfpuQJiYwSlq47o5
	 F5S7etEGIbaU4+SifH7Bhe2/goaZ6yHzoQD5o+YUFP3eI8sRw6IaYpliFQV4SUVeK+DZ4
	 uFAzZumPq4Mql6yR8fx7ZfdgnM6WOBfCwifxegoff9+19UJ5WF8qsPzlbqDG79pYVTSy7
	 HTVE5VHiYaE4CTjQYk2+asJ1Up8P9ySsQcxNRkMAiWIBSgL0JZ7SAYVTKk3BKE9MxBXq3
	 9FopE7K/fSAK+aoNwbXznNcxzESf+2uYI7R0Iy7aUls0cv9Iz8F4XCE3QQVuklU4Cfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+a1mUes;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650A60A382D
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1650A60A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+a1mUes
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so532229b3a.0
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989821; x=1795594621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
        b=W+a1mUes3vV00BBPle+UCfg93kujO99YMqjWujkvkPD+BeS2+NPxYw7masbH6P1IKh
         wdOvcsZ2pAgt+fXBdvJfprW9IoR642HQf23NvImAiKeYtqXOo/EO21JoD6rdzYxI6HkB
         d+4fVju5k7It9B6BAeaTX5XYpl2S37eQXLd8QG3TpDi7B0g89Y9FqmzPYNSuBVchf7Us
         86kcuVBrAaxntjwtEemTydPfYxOxugvDpAbr6hV3VFHCkkQPSFte6qqxlQuIIYy1wjNf
         JfOtV9aVbYfEVxrEsyMyd7XjSC24nMn2WPVchUbBzpYLTp25xOe8n2KagVJz+I6FDIat
         QdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989821; x=1795594621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJxJeX1TZ4NXl+gWbQJlsLUGfVmetcz7/E4tPwbQkwQ=;
        b=H4WCzd0a3N3PjlvpL9Ylzowke6lv/gks3egpeqy2cXd53rYzE2UTxhb/JS0jNnhsP6
         QkWHwF+cI1xvKKMoWy9vkYYpkKTGpCR/foxb4gjJdikrkgc2tNLj+sn8wqjNxwVG1gbH
         BcH9O1+UawPtVRBPLkTU2aFq40zAQK651aNKq4SxIr9zpkUT/VuTRcEZHvzvq6yGmKLK
         AIqP5tBfU5LAY5vzYYe3CszAdxpDtVeKr4PW+8dhWBIO7wDAbcusXNXJjoB37nDomn3O
         sI1fWDp63JSaBL89Hy90E77PDo/BYFu/hQQuOlmQNyYP+V9yyUHD4r2rW55GhIM0ksWE
         iKyg==
X-Forwarded-Encrypted: i=1; AL+hErF4Gsqk222INwa7dpgEJlEJbPkukuRgdpV/tFCUKJPP6NXy5PqXM3CIWwMAR6tijyungww=@lists.linux.dev
X-Gm-Message-State: APuU4Z/p+q/2xv3bc3XScA19oEy+Tw6Mbjabkkfu7P8Sb3PM3tXrhNxV
	U0SQLfRSoeVmsSPuO955D0/7iFggqOoaBjM9czcKw/ssa2QA53t6k8tig/6xiw==
X-Gm-Gg: AYBFou3ZKWdSY0W1eyDR5t1l1CiEDJYau8GV3FiaQe4C8azIBG8WfFNcbW2WTQnfB/7
	nF0N7KixsZVjyjFm4AdffZJKxlYF/tdoPMtIvUkmSSf/2fL31Uscz9aakk+Raf/IVgTaUAxlDqv
	wjxviCzU8ckxIjQzL32Y6iIqlEblZGa3dSNZ/dkujMfZFCez1AW84EiEJqJ8R1cUSSvLyp3kBZE
	5Ycs/CPU2JP1VrwEZZNTbH/lKfZPDss/btHu71QM/kj/oxWUveN6aZnfLV5bpfcF917x/QvCNac
	mvCqJPhAF5snqw2SI4Q1AUmFAABcYpxjjV3wBVOaJ9ECTrQ2RRy1IqEPblXazotiJsfZDFJw6vr
	+kuTIKnfiFrnWBVp8Dh+gtaaI8SwlVN3eYkzF1OhloSpa4z34VOeypki3qAG4FNRmQbb+cNUNCg
	HWtf3Lhm+w14Wk4sJF9KN7XS6KUDUJ72oPkXblhSE603tCEKjcl0+n7e2BooZwQq9NOvtGmkhNv
	XE9z9ApSfwOop3Rb/bkMNTUzUJD+ueI8FOxxMkaeyQWZP0TpOp7//Y0eRaUMI5f7IYMS3UxH0Ln
	IDYELr4va3Foa+KJ4DkfjsyHGlGixHowxYQX2IZQ0ChPiVf7tUFCEIBCRRCYC9NH0BlLju0=
X-Received: by 2002:a05:6a00:4f89:b0:878:34d7:697c with SMTP id d2e1a72fcca58-8c5d49d1ac5mr1652424b3a.42.1794989821521;
        Wed, 18 Nov 2026 00:17:01 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:01 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 09/13] mfd: nct6694: Rename driver to nct6694-usb
Date: Wed, 18 Nov 2026 16:16:20 +0800
Message-Id: <20261118081625.2399247-10-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Rename nct6694.c to nct6694-usb.c to reflect that it implements the
USB transport, in preparation for the core and HIF transport added in
later patches. The module is renamed to nct6694-usb accordingly.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- Only rename the file; the Kconfig split moves to the patch that
  introduces nct6694-core.c.

Changes in v7:
- None.

Changes in v6:
- None.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                              | 2 +-
 drivers/mfd/Makefile                     | 2 +-
 drivers/mfd/{nct6694.c => nct6694-usb.c} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..62517279b5f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20081,7 +20081,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694.c
+F:	drivers/mfd/nct6694-usb.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f8101d2a9ce9..af81e00b3573 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,7 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694-usb.c
similarity index 100%
rename from drivers/mfd/nct6694.c
rename to drivers/mfd/nct6694-usb.c
-- 
2.34.1

