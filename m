Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8193BFE24
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540058; cv=none; b=nFqZmxsjwWyEGqe80UatG8GejDAwzpwqj4IUpvzZdS4AYVfOQ/WPXBjn3DW9Dg5omiGJZY6PmCgJnkR3wDleu0UYLjtF668QrtweUteWPfR4MswY86Sxw7QrqZ9O98/f2Y0ra8DUAakE22nBRa33DI1a+pmdqDWC4NriyF0OK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540058; c=relaxed/simple;
	bh=WAeuXX+lP9ApAmDxLig8RAtvnn0hthSMmgK7I/B9wz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fs8LiIQF2kEpYk8tfxi+EDp95cQMHla59Y8hJesSGzS5fdgPBqKozvYzK/4naZmd8UY5/F092AmQ0V3cgEfSWrHnRSXejVLiRiUifsfgiITApdjtTYrO0UvjknhiGlbPopbHyD1YwQYh7r5uQv6TGTlYD8RTHkKxKy6pU5/+3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6/9fs3K; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6/9fs3K"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so11828105e9.1
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540055; x=1791144855; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=N6/9fs3KbOOisyRcyBDR3kpHxZMEUQg/TGmu8saSUkW+8vAgxYuP7KF1mfmwQUpgBv
         6AEwuIWbAoU7p8qcu05ZsGZI/LKrdl9GI1bhKIzF630R2XrezSVfVO+KaFG68FkqG478
         J8jtwgW2uDbH2sBlB0DNAUm+YnIrw14r/Hrh1TsT95782N/HwGdSSOPrYUjeYfX1KeXR
         41kGwLz5UgG9cO2JXYBw7jTe703kLHB4yItOUqJu6CSxGbVMRnKWluRfl+0Gt2SJewGC
         6+z8WF/0an12ZMD43T8PM+9UFJfaXa2bWL3mZeTz4GoStS46J6hGsQgPiyENCHzw1SNb
         7itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540055; x=1791144855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNSR66L+rsqa5I9ez3liVlAc8gcWggGRjRYsUUY8qc8=;
        b=KL4Vt0Jd68EaLeXZ0jq1wh1UEQRh1HiR8B/XCohpG+RgNxQEernyXUT8kzYkQRb0Gt
         qsyU+XFjtxmo1Q1cI6DKaf6Us09E4emIbxQieU9PYJK/MXjqYR0SOzDonCvT2QvM1z8f
         /GIpPpJd2XS5OhPq3p3x4tNZKv2FbLd9B6owD+vMyICz3lgTMDnwFBAfCuGkjI+FFmzF
         /PQjqO/OZZk/iqBnTI5kbwme8Lnua7p+6SCuc/cWLysP61YHPtoOoqaVvEtmCWTkQFtM
         wtOraZB9jbgD7mV67Pri97qK3aLzz8XI2hjC17OJ/sPn3ghJAVQeF2gyefUbh5yP5V79
         wK2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9Sb3UTglbiJKu22gqPgRWdzgzAAxdAtv5hkUDUD5pLSjpwF6pNxls7buxoD63rp+WmIM=@lists.linux.dev
X-Gm-Message-State: AFuF++nh7lhxBVEUPTOXlzjmxAn7xY/iVmNceJr9m4HDOjiKEiWjQnVE
	6F8xe1Ika8A7wf8mfzlLv8D0rPONUKhIXXy530MHpB/p6jQXE2VvDq3j
X-Gm-Gg: AYBFou3FC4tidErllzY06oEbgB5xejWE6540ONsAyHHqq7PucZbYUwtZYww3u8rAJNe
	KC1mE2im6a3ShL3z57h8YGt6mVZXJSUMn/Yi4wk8wUAtCSEGd7AEVxpFg2AUYyRWj5oFHFMDcXv
	rGR696eAAvGdv9L8/8a3OpozjRo29pWLIRXLdhB370ltLytbMT4M68gNXy0QlYh5nRtBfJrSzQ3
	aStipSL8S884raI1df/60pVr+CjawGCVyuDvam3jP62tguSP7Yf++I/TANzA3VzSlBO5s4fnHbr
	/saz3AhgFVWlGvhXokAQ1e0ux96j4MuMl6zajuPti3nw5JtTRUeRsj8L91nsFSxtWzxTemcf3+G
	RX/2CwLPnq8WJQTDVZlOxipXU+wW9vUp6aEPpowMoe7zUwMn8DWQw2YN2/3GMyDxryWkEkGDrPx
	rsoMUOhygLESn2vVZbUQXMt3qO9KPEgKGH/dt3cnMsNmanV9Hq0CBqVeT/oWSJ23mectRW5JpLv
	UZgvbe29g==
X-Received: by 2002:a05:600c:698e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49fe66f1491mr205824235e9.27.1790540054611;
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:33 +0300
Subject: [PATCH v13 05/13] Maintainers: Add entry for
 drivers/mfd/zte-zx297520v3-crm.c
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-5-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=WAeuXX+lP9ApAmDxLig8RAtvnn0hthSMmgK7I/B9wz0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0S3ciOtiZ4TddTH93kGsp4UXVIfMt7n79s
 r0ElotOL/CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKW/BAAmpXG/xbFgkzgIfhZqAl49ngI7YFzIm4
 nlz4d2lVrIFvPWl/QBMAgDtvhzz9OJNp6NEDOEqvNzyqT1VxxeNeQ4zJG6SUIAIgd20+957sTR3
 Nhs4WqZ4SuSyLxnIyK74JInCTsYoOHXd62yllcHYuxsPMrYNsqYj/zz7LJCSOkAasbwHg48i6Vq
 Tz64Img1+QUAIeCyAxKNi3fN1pNY6xASp9UIDE+ZeI9hLi/pHeNRnW1Mt4aCGvMt95mqSB+HbLB
 DDEyFDIh7VAHtst8NTkqz25FsA+hwBk3NH6L5qXbTHABfXFJHoOZ/HrdFRMQXjguwYT/0DAGiAN
 AOwbkj4Focx/6CCTNpcqMBIWFs4RpuauE1YVAUWGue8mlYgk5hVbNCFcfuhKj3wG34yv0TjUxwO
 QyphlSKqxLu14akUrCjKnmftBa4RlZEnuvs/bVzNQXAmdeY9wvGjMNyAl5fkZPLRDF589mBbs5h
 vkhnlFUiNa/kCEeCtncbCB2fFJmkAH9AFA0+Z328yU81QFo62/A90VHRK2J1zpBnuaS+ATNc2xh
 b9bVAEUy2R4AsN6qkkp4prbioRkXdYmz+s23mKBOSZAc9AnqbUcUiB7u5flJk45geDUcbvPNmFR
 g5XFhBuQSAb97ggmKp7jjD53F2dstl/Rmc3oo2k+B0lD9v1OMpfI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This was broken out of the patch introducing the zte-zx297520v3-crm.c
driver by Lee Jones' request to prevent a patch dependency just due to
the MAINTAINERS file. I plan to send this patch to the mfd list once the
bindings, clock driver and their MAINTAINERS entries are merged.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06dbf9305518..41c287316d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h

-- 
2.55.0

