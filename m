Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2235743E4BA
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509427; cv=none; b=G6pSEsQSFM9CXo8Vf1xUN50J8Nw14Q9TUNM+7uKdp3uj1Jb+8hSYvmvDaB/BBXfh1hFerCO+vryy05zEMqVWFdT2EZri3Q4/a9e0r9gl2SZTDVmvhlLJxg98mIBpvGVlz9Q1kejkNPOlzyRI3t9lzk8sPBXXDsnAdBMgvuxROsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509427; c=relaxed/simple;
	bh=b6B53jc7YA9gdtC4uNceBV2qg862T7PJ6dXNZqZiQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oenm7E/SmnkNomJ3OX7OkXSWtBg+Y++jBvTDn9qMxO3C69tip2ultLXc+ai69CUPrtL05uaXcyM9uZFgbLrZrf44PtgzreJPxWWcmLzoqlrZr/R3/HVlEQJyKZOd8XRMdBKyIb8GW6leILf3Dkvlc+Y44zDWYi5daQ+jN7mNrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i9uQDe3+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i9uQDe3+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b77b150aso4156865e9.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509421; x=1784114221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+oOYpEkuNj39HQ0iyySiPwW15dmAEx9n2wnPsb0pR4=;
        b=i9uQDe3+FhBoO38m6sIUN3+dqgTm4OTNt09SM2B1HJri6NCavlbnj1mIBg1MkagMBO
         CZI243VK/qFtKWFUPdTWEAwwYKseaGuoNLXi20b+OjjaenYWTQYOaBXOIzMD+Crw3Nca
         dB0lyMr2YiFc3DSh3AP5GoiyCWRlwrT7QCwyah2BBiWXZ9v6uV8hLSZdyPdmlJrETn5S
         3Nm7hKyWZDHM4a9BbwRCt/v2nlPKrPmR5eVqOm/Puq8FCoR9DcIvbwsayh0/wumMNPMs
         rnEPP6aqp1w+MgELILCnzIaM+ZZlCkFuUFdo/zWmdNH6Y2bkb4XWSlIdzU9zLg1KXZgs
         FDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509421; x=1784114221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+oOYpEkuNj39HQ0iyySiPwW15dmAEx9n2wnPsb0pR4=;
        b=kuZq5XQBdLlRagBKyZO7awA7Ifz3Sy79SgHr2TiBPiLE3WBtX0ODuU7c2lwk1Q0Xe6
         IB8XI53dX6Lt01udp5IreWTR/L0VlH2LMd/GAz6fdILX0ZUNDGN/PeoiznCcFlUL0ujJ
         2zq6EvhekkBXiNlVprF0tTiCnIqJvmoV9ZPEiUmZLkXkTGmMxmycU52ek9n7De+HuAFg
         4O2lJFKOBCTJVnPf9lt5fJ1QKe67/qsrToiaVFgkUmtzXVfy8sYY7qKBGAr8QNwA/Dxe
         ObsybeYHjEAYlATR//ZbnvmaV40ZMz/hS3lEDK83pnuNQpAOYgPt1tyilsLvF0LJFSl3
         zZAg==
X-Forwarded-Encrypted: i=1; AHgh+Rpg35p2ez8eugwbhbm5sZAN8c0f0Gbdxi4ISJGizR0PKPlmanw4dPxIh6BMSGkPqsyQna4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn3KKh9if+ozvcfSsiuiwQucPsbLyGzyzgRRHOPR9cUgRiCh/c
	NUbeWkE6TXudNIxd68QDzPgj818pVgpdQtKHDBoD1qTrEezke91M4nhjRys3AWie8R0=
X-Gm-Gg: AfdE7cn5UaK5akp5Z+emHUrihEOB2wxzI5peAjmckd67NOy18HdTxoxBGuBAzh8jo86
	ktC557mqWm5X3HZPVKY6CIMdtqs7Du+ygT8PSL5umBbZEc1MCNXhpRkRDCohB6rvVPzofI865FL
	3PB6QzWnUm6S/R00p9XjwIFQL/fGPR9IS2SWn0JHBNqIgO8S60nvJlioc3SHzVu+awWGtY2Em2z
	4dqMlUbD7hKxMk6uOt60LY8cfjFoVzB8U/ZikAlyFXrNbMKTUvm4yFBGQSJh3mzmxfD//ejh4bs
	Av0NXTQpkrlvAmP3vpR0TYsBgFckRUX+BYfZ9WjQWU3hJf+Sb0DM3Ek8ylK7yxRbVB9NZPHSnDt
	y0d0Vbe0euQRmYc/5Lw7fkEsD3vIYsT9Lp2LC0dmFGeDuXsSS7MMlxhn+1SZSMiaFvNt0SOKGF9
	zj0xZquDBoCebUuIZTx62u1xP80INAnMQ5ksFz+N9KFFlXxgsvvcUWs0XfoaMBKqSgaog5FPCH6
	JsL
X-Received: by 2002:a05:600c:608e:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-493e68bef22mr20762255e9.22.1783509421383;
        Wed, 08 Jul 2026 04:17:01 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f44b3bsm115190245e9.9.2026.07.08.04.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/23] mfd: twl6030: Use named initializers for of_device_id
Date: Wed,  8 Jul 2026 13:15:21 +0200
Message-ID:  <3286c57c088c69d4c9296f66bb8e17bae8824b93.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=b6B53jc7YA9gdtC4uNceBV2qg862T7PJ6dXNZqZiQ7Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFr6hRIEruLKX7fBoHPIwG9Bu6y/MTHavwPy CpA4ivztgKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xawAKCRCPgPtYfRL+ Tu5kB/92DLjdtq7rVy/GvjeKslnqEQ7G+FDBh9wBrCIX/7XUwzkqd5qJyp24EZRH3N/xVgvMQWy Klmkr4o7eNOsVgQXA4qGQJHGyAnQDPBhQl7NWWWxrappgSQIpGnlB6RQqGrzn82zomNI3FgHPtO D1M2UoDKcJRozfn+Y1ZtEiZt7+YiwNa97+wmQ+U+cGRexwIv49pIk6B84KQj7KvqWiNqxWpNAFl lswTaq8PGpJYCC+QcQm4W4YQvWzBpF+vSP9g4g46rX/hiak3oAQ1ruKgJF0K1630UDZDaYjq/TK uiTDxgvw2/sfr5V7B46WwC3OfGZj3EP/yA+ByrAVYB7IPsN6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

For .compatible a named initializer was already used, unify by also
doing that for the .data member.

This is easier readable for a human and more robust against changes to
the struct definition. This robustness is relevant for a planned change
to struct of_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/twl6030-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 0ca00f618d4d..4303fb288dd5 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -283,8 +283,8 @@ static const struct irq_domain_ops twl6030_irq_domain_ops = {
 };
 
 static const struct of_device_id twl6030_of_match[] __maybe_unused = {
-	{.compatible = "ti,twl6030", &twl6030_interrupt_mapping},
-	{.compatible = "ti,twl6032", &twl6032_interrupt_mapping},
+	{ .compatible = "ti,twl6030", .data = &twl6030_interrupt_mapping },
+	{ .compatible = "ti,twl6032", .data = &twl6032_interrupt_mapping },
 	{ },
 };
 
-- 
2.55.0.11.g153666a7d9bb

