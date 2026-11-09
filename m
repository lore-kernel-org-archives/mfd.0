Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236326;
	b=e562neS42a9fX8Hwr3VD1uZBzwQGNnDZwC1aLO8mXtkLzrllxSairO3+ouFdDE8tI3Ge
	 /jytKN8Vhl5sQWhRhODm+yaYRLi3xuazpRoV8xeIwLiVtaBwaftGWB2tXEuHy5NW9nD7p
	 ryxhnz3oaYCkAqRMqz+LRltYgPzX9QvohHgveyBo/f174g6Ranuf3bt94q8eauU4cNhTm
	 5yvGxl01YYEVwgYc2e77AvMyKToCAWqGXf6yUDZWkBYIjoUZ2oHP2m9dZmtpHfVUe4Cln
	 r1kODBx1hy7roW3uMhhm/0UI7K692mV7C/lxzS8kpUFpcKbQJWNG+UyOUuIxcng/I0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uyJBLSDoizhjOknUVT26QP6A4fvklwXxLKrc1fwBHFg=;
	b=yrwwf19F2dyab40xnm52fbIYXV1+6bdtYxG+QQbF7nkwNJfrXJCrRVpUS6m2h9gLNOey
	 UAEhzsX+6DQ0G4Yq743ghAdaSokV/1IbQ0kd2ao1wZwCAPqHWPSiCa3p4JEpo95bQoyy6
	 pPcDKV9i5GOKebubnQ5R26ApZHjGFmbPoAgrfLWXTm8oIMsgMP0TvRPqO4U//Lzi756ju
	 rcGg24AvtYHp8PFp8JYeAfL6BcOFb7EzZTJjifd/WyZgHq7bUBpqPESQJQ41GtGM+sKjg
	 3niADPqwVxm879X2b5RyfEjEi2/ZrgpG39P3ujQ33e+3EX9BkhUli43tsXKBFqDwFkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUqtZ7xj;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2E606EE88
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B2E606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUqtZ7xj
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b190cdc9feso532578b6e.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236325; x=1794841125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyJBLSDoizhjOknUVT26QP6A4fvklwXxLKrc1fwBHFg=;
        b=TUqtZ7xjkxVHfF4H4YGngxcG9t2hP2uHfWttirLIF96r1W8KBa7Pr9u/Q3rGmyq331
         xYzE4Xb0CYRVcRhz0ZUW+aByBMCQFBsXNesVH31dX3ZSRNdwGzxbdJ+W2Vpjdui639Dw
         yYeNMdRdu/62zlokC777/jE5eZBBrp57CVrO1zaTP268dXTLLeHSrMCM2cD2v2MmDTBr
         m8ikwehRNTF9/9XIRetcNRudf5CAoZhXWVuLFXGhxzzmzn2Q8TYhTwZ5yw4gLcpbvSoa
         1eSYmb14L2w/DP4XVvLtHXOLcIndhpWVYbjoluIUq2pdGELt/TbhrclbzphGRTLsc358
         qwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236325; x=1794841125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uyJBLSDoizhjOknUVT26QP6A4fvklwXxLKrc1fwBHFg=;
        b=Xor9/SQJ9m4XdAeOL6BCoFsy1ydX4oUdUyM+UyByyQyA5a/+iVOqHKe27UjIsIVP2v
         Ys1PbQwIwJ+XeyUSMXm6DG48Z5mjQChuRSY0XUQ7wQQ+B8WJ9yi5/ZUK121+9GLi3NV6
         bS6BzVPx9LPMf9QUAymS/nM8zzDmO7NMLXpuxNoqTRUPXQd8zOZT/WWQ79MQQ6N0737l
         Gs9da0z5wRO1s+NeDfodNQNE9WeGbB0w5dwrKHHGR1hZoyLclEsqJqLaPREIuy6QqdSL
         Ykl/11LTlmbqIF+NZ82aut0EAHsBG4QYqHRgNWquZAZFopQav959xO31O20axeg7jG9F
         rjLw==
X-Gm-Message-State: APuU4Z9BiEaHe3rsQ+2XNQPCPUXwwI71DgMPvUPr2FPn10JuzXwvsPcl
	4scG4PngVh4DYERv3vqDIkGm+e1dlYUZThtkA17WS4UC2kItxcObC+mQ
X-Gm-Gg: AYBFou16Y80JJSP9RI3Ko+pUMSYDB6RMZxwwavK88sxeBaOHAAxzXupI12YvYZ9oYEU
	wRs7qHKTCDb69nXbg9Rvld7sx3yH35+Up/eqBXE2ZupW/9OlPnIslMXFdeFREgFK/N20ik9dt//
	RZlU31SYr6VwP9qexSXpVWgZ8W4yrvxEKRRAagi0kQRRWryPsfp11koxw/x+ZgC+nBMY8uoESmq
	4PK7BQTEKc/I+KHgGg3QArxBND9KXwmN4SmObgbNK4B6YUilSNZDsGSv5HTrcVTWCgdmj4XhWFC
	4WyY+1ANbeS7g3+72s+Qavlz4iDZjebG0tlIWsoVu+O9mAOGjreldQ/vS3Efr4mTYFyfwCHLn9R
	3cRJevQ4He0mDbGOspE27UZ6kgeQ3wN6LodQXysZsOPsgpjmMnrgOdDn++Mx/bJf0Ew34SLG6s6
	fdguHKwrFKyVq5RmJE56FPVVYp2/eME7bTLP6RjOFkqrkgG9edniGN3QWy+Qn7O7QdVSLVOe1fA
	GSzoqlc6F/BPCFq+ZC68JH+yu9CXI7tYmyagnKrIKzQMeI086DfkpynIRpJ0+7vWgEXRnmLQGCw
	Z9IudAuRdNkY+ih2PjfbSTz/mRKhGw==
X-Received: by 2002:a05:6808:4f51:b0:564:347c:5aa3 with SMTP id 5614622812f47-56814207705mr3716027b6e.2.1794236324825;
        Mon, 09 Nov 2026 06:58:44 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:44 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 7/7] power: supply: rk817-charger: Clear full charge cal on resume
Date: Mon,  9 Nov 2026 08:58:33 -0600
Message-ID: <20261109145833.1363319-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109145833.1363319-1-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

After suspending, the coulumb counter may be off by a bit. Set the
cal_soc bit to 0 so that the gauge may be recalibrated again on a
full charge.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 0d1ec775304c..1f91703f2f64 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1377,6 +1377,9 @@ static int __maybe_unused rk817_resume(struct device *dev)
 
 	struct rk817_charger *charger = dev_get_drvdata(dev);
 
+	/* try to recalibrate capacity if we hit full charge. */
+	charger->soc_cal = 0;
+
 	/* force an immediate update */
 	mod_delayed_work(system_percpu_wq, &charger->work, 0);
 
-- 
2.53.0

