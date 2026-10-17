Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D7175A64
	for <mfd@lists.linux.dev>; Sat, 17 Oct 2026 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198083; cv=none; b=kYGdGjNN88vszJKQf/JylynNFfJdkmK0C4aCp/fDY+JyVEbn5FMkhXGWC4DBI0ID+4rSPyT++vPewARBWtmBhhe7mAZi2Z910QEt8KPWMWPvISa92z4sgD+pYCDcqiqtfYrTAz5YAhtNyqrBqkvnTp2dNAGXaKiKSTcfgsV2T78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198083; c=relaxed/simple;
	bh=uQd8KTXKI3I23lJLW91Lf0V1sEGZ4f5qzE8kZvjuFEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvN1FiEH8z9VdR6GbZDaeRFfv0wa4FfI33zJzFRpoIHRHuHu2eAnzAMZNNok+BiZot9zg4KZjv5kh1flEV/tZ4sbm42xEymY++K2PKK2tQ72ZoRyIG1MzqDWgAH7bwXbO24OQOKP2JGiSgcjBjoAViqknEJgInLdlZD7147dwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3UZE+9d; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3UZE+9d"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so256759a91.3
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 17:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198081; x=1792802881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7WQxeka8iJk8UZewm7aIuKt31IFYG3pfmjyCh4csfw=;
        b=R3UZE+9d6bgJWTylQFvJH08aUY4TAJxBf+BfA714wH7IeI6Zc8Ai/a+jm8JfmHAyM0
         Q8t4J9UitjTVap0iuDqSgrff96OVXEAkX5hp/aL1yv33p0Z4dyXB4enGabchUg1dy/w9
         O0xBuFwrSQf0t7jZcGL6IDfX+dS86zyYgWzueh19JK2lg0fPM1O91+o7o6bq/wPYbPAe
         L7Gxe7UxuCLW+7GlmtnAHL/NwiUZuNLL36sBihmD3tr/gZQS6PfG91vUqr32CWGgsL1X
         xlRaSnquvSOl0yA90gNDtK5STbERHkXQ6aou9XiKQAbB+NH2klSjsXUwZOT+WYkG1M+G
         5jDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198081; x=1792802881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7WQxeka8iJk8UZewm7aIuKt31IFYG3pfmjyCh4csfw=;
        b=F07jUBrRDB+pAJV6ehgzlukI9DzWK6WcExsuf3QmSRsuT2rXhJZTn/CCvudZwmtd82
         pQ/5AiDuD36fq1BULVSrlk1SbsyTuCJUPvCLGQG4j03eyPPDGv6X/bkiXedD3zxH3UVJ
         I3eXPE7bAJgPwvi9JKucIi73SnE24lGD4AsjWjsZsK5V+5eUmZidBO5NxnFHeqfplcBZ
         N95zo67ws5cgTukYaL+yZKVpQyF+0Az+rGcRsqsI9UE8uBZvwXk8/ecoIcLzOpGZ2POF
         sheDpE2eyK2WEqCrSdgb5eekKQ3xkrqt6Nlhc2hmc+bt+x/OfEpn19PT7TFrjLPL9nfe
         /G4A==
X-Gm-Message-State: AFq9FYKAQFe6GTMvstp2MkXwtcBYvN6fJbXkW+5xq3yhvFy1udLMHOxG
	O6+xO2ybvo7ABPa0zcqeXd9t1x/LzUlO3p+HbEsIsrCPRL256sW7IMNSUaIh7w==
X-Gm-Gg: AYBFou3ts76z/sok6eza1p046YDgtGlmi+DBP67SxJ6Os+g+RvFhwAfmY8m4OnLdN85
	UfeFOjFpkaJQZym4Vuc+rtjYAeKAzL3ZKy13UQGWgkQlZMptdUMUxZfIbuGJuw605jDuEBL1/EZ
	4cu/ySPqMGoDyZD1DhLJITj75fPFbpKte/F4q8IXzZRojYXtoOZYik1foJdPLLISynG3ImHU4Pl
	GZYsT8SUFOTLKJsC8JdUfn2vNndvp23GYWwxwbAzeMS8Ijt4blKGYTNv4a4baOq4remlxisGAd5
	eD1pRdhi3nJ7Y+bErRpz50MTDXlXBsuvChEw0SMpdYL8DXApH+0kN28BQLMPgU11qw2gVm8vm7k
	5mEGqEdQAj4fADTPer6qwbsS15Qjp77Ewss+HApSURtZpn7TDpHPhq5s+PMzCTZHLAa1Jz2obtm
	r8LorMHaXQYbk1UjWp9VIY1xOIMBsDaCOJT/ghe7At2wbwD5g6ZHNMITX+2/kPGK4Z02TKXo84j
	bDPMgxBzSL17uz+D5YMMtzd5u4ofegq1ZBYt0vDklwvlg97LYlMMuPsAZqdGXXRK7JxsBabW7uV
	BPH8Vt7VXzBKZp8ubogzQIIDHwE7yrz2zMRf2jH5wnGrNSrl
X-Received: by 2002:a17:90b:5112:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3acef134c23mr1427783a91.17.1792198081562;
        Fri, 16 Oct 2026 17:48:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b16c2asm2604171a91.2.2026.10.16.17.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:47:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mfd@lists.linux.dev
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] mfd: twl-core: Embed the twl_client array in twl_private
Date: Fri, 16 Oct 2026 17:47:58 -0700
Message-ID: <20261017004758.1256875-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At most four I2C slave addresses are ever used (TWL4030 class), so
there is no need to allocate the twl_client array separately. Embed a
fixed array of TWL_MAX_SLAVES entries in struct twl_private and drop the
extra devm_kcalloc() and its error handling.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: use a static array
 v3: Capitalize Allocate.
 v2: don't use twl_get_num_slaves().
 drivers/mfd/twl-core.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index f86df356d658..4f70d49ed2f0 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -153,13 +153,15 @@ struct twl_mapping {
 	unsigned char base;	/* base address */
 };
 
+#define TWL_MAX_SLAVES	4
+
 struct twl_private {
 	bool ready; /* The core driver is ready to be used */
 	u32 twl_idcode; /* TWL IDCODE Register value */
 	unsigned int twl_id;
 
 	struct twl_mapping *twl_map;
-	struct twl_client *twl_modules;
+	struct twl_client twl_modules[TWL_MAX_SLAVES];
 };
 
 static struct twl_private *twl_priv;
@@ -788,15 +790,6 @@ twl_probe(struct i2c_client *client)
 	}
 
 	num_slaves = twl_get_num_slaves();
-	twl_priv->twl_modules = devm_kcalloc(&client->dev,
-					 num_slaves,
-					 sizeof(struct twl_client),
-					 GFP_KERNEL);
-	if (!twl_priv->twl_modules) {
-		status = -ENOMEM;
-		goto out;
-	}
-
 	for (i = 0; i < num_slaves; i++) {
 		struct twl_client *twl = &twl_priv->twl_modules[i];
 
-- 
2.56.0

