Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141A1A680C
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364936; cv=none; b=Pe9kizk1NMSizonSrY5E6YVMYM0olqV4bXIt9PYJNI6GbAp8KQYD3TS+qWCE9uygb1ObERhclhlqBqSlBM4ZoNlSFYntAuJAc1YRawBS5TCwjJbUApO4CYScPtNk8w63QEhoeyZ6YGXO2TRk3pDWLV1U/c/I/lV6VJJHPvrMNPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364936; c=relaxed/simple;
	bh=oSAM1EU6QbgMvte1PB4fhKXxFYiJ3swnTBCSusS2a3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RObFEtz8tFPVkKuG3rXvC9gGC2kQyA2Om7w2bkYaIyIS1BxvU8GAbCeYcn+LvxBqVjLEG/MR4mqIkqEUAWmU13RVLy4Gq2wiCEp0gBlPPxGud1y3u9Heg+CYXfa5gJqr7HbAnLyTRNhih56Zw1csmqIvGoqnV2bpXIeZ4zqo5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwzJeJPp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwzJeJPp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9351605ad.1
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364906; x=1791969706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwVYNJ0nxEgUJfy3jmzVhfvg2QCCNvzMgAVNpWVBA24=;
        b=TwzJeJPprKtgHjEEt8UhLWMPLbI05LzVsd56PEO1q3jmQwsQ4qDKNDxMfLvtvayJ0Q
         zB4fMzz2G+y4/6XBt0SHIpA0U/vmNBYptVHDIDk3ix+kU+Mi65x8X3jBKFrLEtH7e8Q1
         fFs9LANkXAJLPWcfdrhEnnqyIYulc+rYt8n1p7XrxuB+1k8AKqy1R0FyHHiICyN4faxI
         owFII3KTx6QnhglF47ccn12Gpad3m9FQ3/ppJthLKyfx/ipN5tR/HQ9DN2OOm+6zFcs0
         gh8W9P0d18MfpRhZMmd5yCSzSsI874coURa0bubt12bGqkYas8ruMCjlFQLX2V30grx+
         WJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364906; x=1791969706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lwVYNJ0nxEgUJfy3jmzVhfvg2QCCNvzMgAVNpWVBA24=;
        b=svAdjAhII44D96Pvi8fwwnax6I/9jFgp6m4JrdqMVHvsNxu1peRcPd5HqRFCdUNK7O
         GlUUGjvZVni6uvX1utC6198iICUa/Po4ZeVix8tXVWRho4BNZCdkJk7YC2MQscxubKBl
         SuGK3ZqKejCAMe+fIOXj9ohDoIc4+KODsDdyfCWMx0QC0+zyu5KucxsaYvebDLsIncLU
         MzjlrWmDqNoDzI6pWtBhsDEltoG2YXlyC/znxINQt2O5znp2FHRjPoet17X3RwU3NiXx
         Hcnl5wgRE4fP3rXL6I4+XM46AaYXkNlALrZhFw9yWXOCwD9BB5H5sYCXZMf4803npzI5
         hpJg==
X-Forwarded-Encrypted: i=1; AKwUvBzupLCpgVW2elHo+qIHTgJ5etSVAgrCTsvbDN4RAgNh2QxVDZo0AJgl88WImcC0apmjtpo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJaKzv8BsQemzUl32rqfOlbgd75aw2ZaRw0LB9ZNsqgvCxIots3
	QxUf/Kv5EqQ27pRNBm59NbwWt54vkBrW6S4PABoP8NCbGUWQZDXuuSx9T4aCBQ==
X-Gm-Gg: AYBFou2MX73h6o1ESqJeuwK/xRFnQZoxLvuKx7XzgV0mEYLudEAQJujOnlAjJZ7ncv0
	ZOjuOmprVPrQjQ07utij06/WVKntL48fn4eZPxR+PcGD9NEfOvSr97jz9x08eu1PajWhR4HCVsz
	/May7k5jkdVXNrrAgfD5SpWVNLUnQY1DLU6CRTDJ2Qnq/yYXUFzccCEKUGD38K07aLX9qPphGe7
	4Kapwol6jg2U50ccnH/ruC1xtV1ENxCdOPqD655UTD7rh4SVrnykAwOOHlajb63sjGB7kpFcVJl
	EoUV5rL2VcrT332O2qdL6rI/Q3f+SvS24IjaO06ibrk5EpcOy1/H32+pCT4EopKT4oPZjFSAFWK
	0BpEn14Z9mhUc9fTgdZDCdPJoEIYTVmihE5Bdf+KJKPYmotGwW5d47uynrWQM4IMDpmOO/y1ctn
	62ulSFDLsaa+jQVFkdsejLEDMeS3kQqHJJSjn+2njcVzRGbTi1wEFWvIv2OlNZQloECLQl2Npa4
	XHhnpswnlOCmiZXHpyobra9SMGl9WQgTTVaa8l+M5hs8qBVu3k=
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e6005979d8mr14276105ad.60.1791364905881;
        Wed, 07 Oct 2026 02:21:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:45 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 09/13] mfd: nct6694: Rename driver to nct6694-usb
Date: Wed,  7 Oct 2026 17:20:58 +0800
Message-Id: <20261007092102.3768818-10-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Rename nct6694.c to nct6694-usb.c to reflect that it implements the
USB transport, in preparation for the core and HIF transport added in
later patches. The module is renamed to nct6694-usb accordingly.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
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
index 65e8a4b5c90b..1f00fd84365a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19539,7 +19539,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694.c
+F:	drivers/mfd/nct6694-usb.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..5ff440fb75bf 100644
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

