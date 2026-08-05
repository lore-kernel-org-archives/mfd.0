Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3156145FFA0
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932441; cv=none; b=JV0yl9NOGeQGcyhjMJV7QaBbc3KsiZNPu0UCAzKhZcH11PDENGBRLrifvlD7C3lkErG34C82Uzlc5N5W9ph4e7Y6YyAevdyHVIf26tBrsBalfh9YooYArCe3fOx2MGmin3+WhHWFjJEU6B6ESqFD+uaUXS6ueMaRUSJRNEGCdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932441; c=relaxed/simple;
	bh=a230ZCfC90axJlgwhM1ZKMw6zyzB++PhLGa2dLzKeqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsPMyflnDCSBssUnB0mP4/nabe0WXhJBMD+O7Jt4cgcECM2hFs+e8GaNGWjQy/oh5xBnduk37PEG+Sbno7vTtNsGQkF2WYH95yJ9MzetSWNYvHcrM8gAYu/03hRml2z5ex4+OYN86y9vRFxyiur0mjViYn7+jnCFNLVuhiy2OBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Mc3LoAxV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Mc3LoAxV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954dff6536so6524725e9.0
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932435; x=1786537235; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=Mc3LoAxV3zYsnu11+9o/GyTcIPHJQ7sze4uaIENaj7p9qjY5NniM3H73epgRt+R3Cq
         0UtA37Ll++kzntcuHEKuxezaz7FdS6Z+yEisSNYey46IYE8T8Oj2wadI+3NeS4M5wMx0
         GCvNwAKHL25mDxJ/selWwDlOYEkOcRFCU0j+SnIiXwXley8v1KLFSqXuT86CXytqbMmK
         6c5ng3FJP/vSyvSwap0S1/nKDKcYVUs0HcUjFyswvAy5uwkjxcxE4Y86Wz6dBcEF+gQN
         ylaDfR+nQVpqQuxYOFyX9iGfyGs4bR1w72+Ln4pBG5PPZ18SBs6+/mjHJ+e8i8VgRMA7
         OYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932435; x=1786537235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43Zhfg5+4+Z1uzvRXKb3yHpIvITffod/8Jre6ZQvzL4=;
        b=GiJUnKcKuQPZOenhSof//FPtw42pzkNlB/zfOI0/oswK3qgDkY22eumDe1mO4BWeWJ
         xy7LwNX7B6iel9KsdmOft7kcUuwu5hOXP4KrGQgNHalSHz3vN8xoa6ygYhd/ix11brq4
         UNcLZ/K1YvPK8tM/pJOXyTPfx3n42m6Ob1W5Mq/OyKpSIS4q+rsQbPnAP9U2cZD0QGpR
         U1Xublzb+W9fmAiECvUvuMvZK/XTLBzVWj6JfBvx9C3C2Uz5gzgnvj8fZMjp7nh8pJt6
         QW85S2zBA3raqMStEyp6api6ieI48sX6zA2wLr9crAwd+tA4Uf4WY7EZoF35x8PcRbr8
         A+tQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL7C4mNpcMQrIUzBG9pLKCBG7GXVjAN6kPABo/OdERGwS87jYZM3+7Ic4Fh0Y5cdVa2S0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5/YJaLWbmwCStUM6HSyArOeve9XuHB48YvfOeyLnr+WbFoq18
	523GmNPsb0gT77bZ8/Lr5KWC9ABnuk94O6Wyh/k4241EVOPlNnzhPFTIxafPN68n82Y=
X-Gm-Gg: AR+sD11ofCEgKqNJiRtTtp4ONym4c3l/4CSl4rblWinwOSiAFqy0wy34QBYX5na0gtZ
	fH9fFX6gcYgzoFdhbPDTXKMNGF89vSDVmW1V7U5m3ctZl2x3k5Kv9SYMXUSvlnm/AGQSLvsBfxp
	Ys/cQJg+fZ0BHcN8vVSpXnlnHnjZisTTfJk6EbKwpTqnmYAeLh2GkubR24nDeSrO5f1K8kQwdsu
	G/N5g3pi5JpGRF7DkSZhlnTocD6Rx6WM7Vyr4k8BHkqmZgsUriKE8uZyNbevAcFtMTXzN/QUDrV
	jR8MyBPo1X3XukEZI/K2do67x0xo5byK1bqDxsAaZNcBvmo0oP0bgWVPHXk3F2NI8YDfqmBZsbn
	sFZ2T/JWCtehq5U6ioyOyKJ94kTxaHpz0ZyrZwiBrTqdedcTmUGoJcoVL9wdt9rkmJfKkIYt6xF
	Aj01nTu3pn26kNFG9w7yUekweQ9Hzw08kqjsLFEsHpBQhNKdWnoezdIyMK1Ouw6YBO1FGKwDm2l
	Ro/IWkek4KqqeFMCnTBAEfs43CPktb+cTpTinZ0DN2A3JplvgvT/Ktk5RLsuPa7Efnqn+xXbl+S
X-Received: by 2002:a05:600c:1c22:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-4994e7dcf28mr67408645e9.16.1785932435246;
        Wed, 05 Aug 2026 05:20:35 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:35 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
Date: Wed,  5 Aug 2026 14:19:49 +0200
Message-ID: <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
-- 
2.54.0

