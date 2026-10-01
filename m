Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600133ED3D8
	for <mfd@lists.linux.dev>; Thu,  1 Oct 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861438; cv=none; b=cKSGC/9ne3iXjDFe6mgwRx6hwUt7FFs3oGlWgzLi4A0uBp5l0N4rcm9VImSl1D/8LU2tqaSemt3ayeFAXFasBdIxwqVZ9a20QMuX7vmpVGJ0CChx8MDy8n5d/rrVaMCUvhToH23oLS3oC3bA3qAyA+myBc5uHJ1IuPIUEp2aOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861438; c=relaxed/simple;
	bh=LZvJdoqMiLFE1kDgHxNdu2ZkOJ6v87aLJyP7tgfMseo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IXsc7bZ0aGxi5oQYlOmavId43YT0LNTkYACSSuE8Xn0R8AQKQ8yDV180/WyukfC8EKD4Fg4v99e7bW+HwdWZduq9AC6sILrQsv/6ECyX0/jQWlD7aW2vLXR8Ob8y4JSwPbi7l7qo6lSAveleJGFqgwS+j9115NXi2YkvBVBbKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ch8VN/UH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ch8VN/UH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so34152055e9.1
        for <mfd@lists.linux.dev>; Thu, 01 Oct 2026 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790861432; x=1791466232; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qVy4e5OGZI4MlIMiZQzW05oIlOjQRJp2AkRb/z+b38k=;
        b=ch8VN/UH9/C70G0nlULJSxEFAJMw6ayQETyV07PFDbNhzZSK/C6nheBgPg2D0iM324
         PDdfuKtGyMv9zgcN1ViErC7VmqxFHyqUTbD3lf8EId/V1ysJs0W3NyDmCF3y43l4Hkmj
         ycZjRedLXihYmOdBv3pbcp7fiJv8CykOxXKs2cWJ+/kcVT2M97sjIFaE92io7EBUTZue
         GtD5erXy8WbtzoTuleBQ5/RwsTRE7CkMHnKhfHPFq+486D+N0UeFHytkDPdzoCjlDTNu
         efob4TZimKokzGWBug5kc1ERv8E39x26YiqVfwEQREHs88+dfzccGuhug+YJqSTTVegl
         0KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861432; x=1791466232;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qVy4e5OGZI4MlIMiZQzW05oIlOjQRJp2AkRb/z+b38k=;
        b=WzgkRubz0bMlt59ZAMVdfL4v5jn7NGGQAxUk4Ui+wifdnmFZ3Y1LpZZ6eB+63yGwSh
         YYx42vyp6FV5f7OB0WeGft6ow3PSBekPDRCttSqQ/ootIwGVUlIjQpyrpkh4U/CZdWDY
         dRYd/+yhNRbodUU2TrBUKyoQq6kXSjHUuNsILdEF4RTp0B6ewkOTtOxXqKDlsrDSxKaG
         aaBdrhXvhU6+mdHNNjOzuYawn4Dz7Y0LFXe0cdQBRXjkO7tm3Yphk8jICA5iGefELX2B
         d1bqZaLlR0VXodaloG6d18Eoli0r9jKRF1o448ncGQwlrkwhi8KcGfGxqr8kx+/XotqM
         opIg==
X-Gm-Message-State: AFuF++lybvH4Tj8TX6Bdg0zDIbuSI9hcHKJidHH4ILaoY34oLBt6wk+5
	PpBJ/1oynKJwIrVYFLJNs1ShMSmF6lWqtuA3m5M3PvTe04zmSNaYYB6MyrZC2PnmZ+0=
X-Gm-Gg: AYBFou0yi5liuLEOEW7NDucYEfTnM4IpWMX/tGZlulGZFOPYpvnnrUKTwDAMfv2Ou3h
	h/gS1q2c/WA2T8vH+T4Rr4JAv4kIup87Lp94ABxpcTyCFzcPXVV733QcJjOkDbHGiNqI9c+G6nu
	gxgHqQEflPaCdw2zhd/08RGc4ClBqp88kaYvPuZrWPYyhGdtAtJVgWCKpLJs12PWSO4izrmUL3S
	O9dFmtHUa7UKf5HXtXMVnETBDrQrdBdVnFzsZZ73GWZP+MqaaLrMKnLTHlicIDVZ00Je5rAQftq
	D3sW02oQN9+IOE7/UPDqTkL/Js80hb/LzdfpkBtAqUg1Cxq83Hgka3bYDtFIBAruNMMZpMcaiY0
	xtQNhlQygfk4No7JtBDPRxDDNYuZJsUymn0jZRU+V5orSLxQg2JXZeJr7+HW+NL+0htrAAiXTXt
	emky6qXsah4Uy0FwuYKUxD1lYRe7sTWQO4MWaksUnd0idnO8DYSNw1cR+3QvCNtKjnmgbMe/qGd
	cqYFt8PJ+R/5y+8
X-Received: by 2002:a05:600c:46d0:b0:4a0:1a18:b742 with SMTP id 5b1f17b1804b1-4a01ad909e9mr83128855e9.2.1790861432366;
        Thu, 01 Oct 2026 06:30:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0267ab7efsm1603395e9.2.2026.10.01.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:30:31 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 01 Oct 2026 17:30:23 +0400
Subject: [PATCH] mfd: bq257xx: Mark self-modifying BQ25792 registers
 volatile
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bq25792-volatile-v1-1-cb3d4ec8a414@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g5MUqZqryIuNEaNiD8zKgXx7
 p22y2/x3gVBvEqAV3KBl1ODLnMEpgnwUM+9GG2jgSw90Vo0zUYuK8icy1TvOomhll3+cJgxMsR
 s9dLp+7csq7/D0YzC+/cD9/0BwFAEBXQAAAA=
X-Change-ID: 20261001-bq25792-volatile-2dc583517c1c
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=alchark@flipper.net;
 h=from:subject:message-id; bh=LZvJdoqMiLFE1kDgHxNdu2ZkOJ6v87aLJyP7tgfMseo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtSyidG+MSuFVlk8ieF78spmwt3XHkQPAmS/0DSl9kI
 qWPnM6q75jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqe9oZ/tnvSH0YLuSVvK1mllLKjcwi/kN/GZ/M32yvFzfp6crtxZKMDEvOf9O
 86KsXnPZwIcv5BLObHeuuTrOI1Duw5OO/aaHTDJgA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Some BQ25792 configuration registers change without being written: input
source detection sets VINDPM and IINDPM at plug-in, plug-in also clears
EN_HIZ, the FORCE_* bits clear once their operation starts or completes,
EN_ACDRV1/2 follow input path changes, and ADC_EN clears after a one-shot
conversion. Reading them from the cache returns stale values.

Mark these registers volatile, keeping the cache for the rest.

Cc: stable@vger.kernel.org
Fixes: 9adbe53e32cd ("mfd: bq257xx: Add BQ25792 support")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/mfd/bq257xx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
index 054342c60b73..01f5fc97f538 100644
--- a/drivers/mfd/bq257xx.c
+++ b/drivers/mfd/bq257xx.c
@@ -52,8 +52,18 @@ static const struct regmap_access_table bq25792_writeable_regs = {
 };
 
 static const struct regmap_range bq25792_volatile_reg_ranges[] = {
+	regmap_reg_range(BQ25792_REG05_INPUT_VOLTAGE_LIMIT,
+			 BQ25792_REG06_INPUT_CURRENT_LIMIT + 1),
+	regmap_reg_range(BQ25792_REG0F_CHARGER_CONTROL_0,
+			 BQ25792_REG0F_CHARGER_CONTROL_0),
+	regmap_reg_range(BQ25792_REG11_CHARGER_CONTROL_2,
+			 BQ25792_REG11_CHARGER_CONTROL_2),
+	regmap_reg_range(BQ25792_REG13_CHARGER_CONTROL_4,
+			 BQ25792_REG13_CHARGER_CONTROL_4),
 	regmap_reg_range(BQ25792_REG19_ICO_CURRENT_LIMIT,
 			 BQ25792_REG27_FAULT_FLAG_1),
+	regmap_reg_range(BQ25792_REG2E_ADC_CONTROL,
+			 BQ25792_REG2E_ADC_CONTROL),
 	regmap_reg_range(BQ25792_REG31_IBUS_ADC,
 			 BQ25792_REG47_DPDM_DRIVER),
 };

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261001-bq25792-volatile-2dc583517c1c

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

