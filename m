Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A094B95BA
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873244; cv=none; b=dthc3HI+xgtyoGso/X5kWXbA5wq2RenjZVvLhGuiK+svU8ZKrlhrkAIYfxeL6wcGEWKPU1VFuN07u01NEcPm3xKkhXf6z+9tBSIFz1iKZLbl5nw2UJMtmdb/Va/Z0fWYGwIK36Z5yiWm5jfSiCER1IJJl5n887R5A5JNlGt76dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873244; c=relaxed/simple;
	bh=tAov/dDw912xhNHWsUTpLi9VWhD5iNpsaOR2Swx1l9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PXglH5wVVl05pLB80DWEIRQeeWMbrzw4QAX6l7rEwuAJouKrENRs4rkVbrGhMAFDfKetQCbfmD23VGR8XOAe11ppqKm61DWcs92Uz050KYbnDWg3M5eZXPs7TV9cgmYE1aL8n/RnpMyKFnobb13oNN9OrIrdTexXGKHExEgzcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwxINlQs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwxINlQs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e49fbf92aaso13583805ad.0
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873241; x=1792478041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKTRLrIyKEMz6MI3wLdSKL+hpevlt60IAPA9xDHCRO4=;
        b=IwxINlQs+Y8oWsA72Q89O7gky1zkK2GE6m3kifj/+AA+bk1fZF23gR0jEU6MKXhDB3
         G+eAMAn02lmfQlJZk7olDT28Pub35iw/vN0TUupRMIbkqFUAjAk1cWJZL17k1v6DgQKn
         46ur4Waz5ZXbkAHc596HY05AQ8HNu+tcYKAQ+VJyYeBUHXNeeOcnrNGTNz5nXcBSX4b5
         wZvjDihfxB02bMkOvel6ad4RNtRRReOCa2sR+M3Aa8ZqO4s4X3iMuhRwHKn6zx+GaUqv
         AxJRuB/mU5Drwb9EUGHmSeqVN1szMYFBxVNph5/WrjxeOtiEvQ96UvvEAJvanPzVme28
         dtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873241; x=1792478041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKTRLrIyKEMz6MI3wLdSKL+hpevlt60IAPA9xDHCRO4=;
        b=iaFyW2A66zYJT333IayyXfYX+QSAbWxkT4seQc4+zs2eX2VSqQTiryjFVqwHiNEcr3
         FPM9UlsrbUAglqaBPq/UB5mOo4R4mFj+oUpZi1o+IlTO7XbzfrRRCht9s55aXBsuHF4+
         Mu6KFsQHKZ3CG+IHfrnMo41JVeRaSHauaqeqSI+BNVFcGvBLLIcqLRXZWch1AtVHEAcs
         atgKj/22rR2z8Ucx3wPHWFgD7m9zFhi1jU6nz35oY73Fci2HHdM0jzal4NsSeRUoaurW
         CqwQab7EoAPr1PttVtdYE6E0u5YdtXYPZpOIeBmGwi0LAQR0VYg8RVvVkAXrK2tnQuPJ
         AyQA==
X-Forwarded-Encrypted: i=1; AKwUvBy3lY1gpwqphUmaQ6s4TKWhbbJgLpXhH0GaLCsDqOHc6RAb3Y6qqIyC8fliZ3oRQHKhUD0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLKe3YQkKPXamRtx9kUnYzXa4xCxWxKp5/pvqqrkdCU2dSIKCn9
	PqwVzauB+wMjd7uTmuY4+fHkF2+zf0UTf7GWeNPnq+Sg8U+Rcg9amrs2
X-Gm-Gg: AYBFou0KX5ECx0lGoXuZCZWJukh6uFSt8Q0HQvPqw6cF/Z/tW7nDBBWUiOcgq2poTeK
	8szgzrxDpR8ge0CjvQjJWSxCyD+jmE6SxATWZ4e7RtZMykwWTpHGpvd8K5Ws1+UKq9GJunY5/lh
	78fiug+cJHOPeCBurCcaIAv6QZQ4p8r+34mP4oj3pSz8CDFT9//kYDpQwAROYYRKrxnnnQCTiRo
	MGUVVDeo0/rYq6S2/g7GnClSU70J4MgSVXdyMrUhoaaZcTMqVm0XYUk1ejhYOYq+/H+1i1A6Cjx
	YrTJrVJvh+k3qAZd4p06nxJjcxh8wF0gX1h1kuuK7NCgz7e2ZCUIchSXULQ4f8W3NNISUl7kxd2
	2lKj6hRTKkzaPE4uYu1XpPGSV7nvqionsASl4qGKOhjNISsIX9L7nyNWVkV3f7rahSZxtrFPDPp
	9rmMMfb5qmIOdFnPhr3Syx8ywvk+Ts+G7l7QoSfR5wkkSmucrtPxd/hW/aGt7nTt0em3LUV9E+G
	29hmNru2/sd6x/fvAE9GPG7ii5Mm3ICVT0h4amd
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr2680236a91.27.1791873241287;
        Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:34:01 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 08/12] mfd: nct6694: Rename driver to nct6694-usb
Date: Tue, 13 Oct 2026 14:32:54 +0800
Message-Id: <20261013063259.2734757-9-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
index f53047aa8d3c..737b17c917bb 100644
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

