Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880126;
	b=u0FTwuHy0BY8KNU0bd7dBIotTXf/cYB7e8f1sOhFCUGfMxlUeeQ0jl8sXtN510YgL9Ke
	 e7rigm6XiWzHO5RcueG92dOjGKZfknkRQDfEG69rOyBP0cZjbQirL0/kCwrA4pqfYO0Zk
	 wssDkO64xIh3bdtoMevo4x1B7Eb/4LKB91ttX4jJXe1syxf8e2XU6IfIdbIbRGz+Byhrd
	 gF0w2XC6B1vjo/yNcWTald+JcHnvlv8BGijW9WjGzn43UfWV5pYjyN8JcKmJzrcIwgjxs
	 qe7XFbbgLWj+su2VNAkxJ7xuOc6hyRmedW3VaBaC55iw6N6ctpV2LXvURmODO9a5L7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
	b=s5FOomlHERbHaSKfji4VvIzBDuD1GAK0mLWaHyYPxWwx4MRimBwIvPhdZsljifnkNP1U
	 FIu7LjZ/5sdfPXM01m4XR1f0ceeznWISdoOD2/0Mv4qZFKF/fD/umXi+9krDay6mRRI2y
	 SGZNDHRA9aYYN1halVNh769G2A2szIuzSLPPLY0PxUgN1GO36Ke1mPBw04uOiLk2NgzYq
	 ccLxwCnwSg3YfarW/hp1JD+FgC4/0k7lorSfBZVKNHn6hswdcK4SrUI11Exh3WyA4J7+2
	 CQzTHSEsOtf558jWw+7aRJMitRDIgskEZ9519Zgs7n99zy2tIAZMSPH9hXeCvfD65bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s77Mrhuk;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D69606A321
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D69606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s77Mrhuk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so34312945e9.2
        for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880124; x=1796484924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=s77MrhukXkr6iuoHMdnq1EaE3YQRc3DDMjoH2b9YmA1KNkZEBYsquWWpNIOVD7/4xR
         KB1ZmjtCTodZeuZzU0x3GkJW+IExo3O1lcwkzeG/dGPGyfjZ52yRh4RX894V0MuLmvWt
         4vCVsAU6zqE7F4O7FjuGOao2Pv/pN/8jzfCkuxWtzBKigfGjA3xN121V7anQBtjyR42l
         Mr5HNI2WZVlLPtnu8D2dFMYrJ75NexuyqHgIj+0Df/joCsZW1lm8LMFLWdLxz/IIf0np
         /iHvf+CtJ9/vYNI+yaAmLtuhv+9S8xlZkCPVwgEihAd3sJ+swcT9A2oyn2EBdnfgBanv
         gQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880124; x=1796484924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+WhCOjHz9kC0UxC3aeycoT6WGib9fNFh6RWvttpfXY=;
        b=j/C5d7smJAkFy/8NGwNxHN3AZgtEuAVoaTehA1HiL6v2v2JhFNXrxp+EOq5d5Q93Vo
         WGhm1/VURim/tTi/mOe2YHuiyoqhCaH6Qo4nC3FQBcTV0eCk0+L3PCOUCSuhiw3aDHYp
         lDBsVpoHSjrPfSxgCLC0xHLBYdnbknOFBqg2d50jEYI4SomQYHUYkXK/Vbrx/6ZFK3e7
         aRX3ckEsQqpA4JBZXA3R/GnwGyk6zllDbqWOZkPhRVgbjxOkPqDBGwdzPCMLy0CBxCTY
         DDufWi326JsdpC9H2A3QjHO7vtquO4sUihi2uJR0YIYlcOKJFXbOi1MZkhd7Rr19ZqyQ
         tBcA==
X-Gm-Message-State: APuU4Z+KyiQUpsKOaYnw8R/3iiuZ6nwPVBqwVTEPQi/9zpw6AhjM4Jcr
	29OO4HXF7ygnav+q3S6aJ2O+ghg6RoRSxjMIJ8/vd6Ls6EUd5vR9shl7
X-Gm-Gg: AZFdTZfINcme0GMctUdU91U9Y6FTsWyi4jS668G6JMlgyQXmM6a/wMe5jPz9Nr/odo7
	LjTDbXA2exQV0smWzLOcz84cpoFbsDhTxfaRxC/4WkDwRNVSTk85SXE939uJyPbHx0dv/FsQ0Bi
	xQonrpI3KIIEtLuVP+3N8KgBnC935IcKTtg4YpOzX3WofwFieCwOliXh/9UuuKcEeuEKN8JidxJ
	g9OvdJHa/WypFt62N6hkGwWiR4exltvcdW3BG42dJKiUnacX41tTiwHmmkDqo/HlG6SXSXmEisr
	S3C6gkGxyDF2ktgsN09z5/Kp2KnS9RlzHZluRYbErvLU6rWt1j5mM3W7d8UQWS+2ojLnpVP7MMA
	abvT1f0YmPztx3+kDsW6U6WCj3l/ti6Okq/sCNQBhM/RIf/nJyTH72NdiFGFlzhE4iXAYVqgx8T
	qV6LcbY116nV05WFptP3CKOMI4qa6p0RBmMiFwjoviz9OQHS49jgH/Je1JJZQF45EF/yY3B77wu
	lL/bHs4ig2YZfNag8gbhJSVWngF5ZPU/BJvDjsQK0MIvEY2eiTUcnBomcivP7N91F6nonJpoQ4e
	x1JeZFtDkQBNFgHRYxFDkUMB3guMng+kl9La6viVV+7nhC7foMJc0xkppT/fDA==
X-Received: by 2002:a05:600c:a117:b0:4bb:a5e1:7497 with SMTP id 5b1f17b1804b1-4bba5e18d83mr191413735e9.32.1795880124443;
        Sat, 28 Nov 2026 07:35:24 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:23 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:59 +0100
Subject: [PATCH 3/4] soc/tegra: pmc: Power up VDE partition before
 restarting Tegra20
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-3-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=+L9yJ+khZAxRa3E+MLPbYZHl84vHWWJzo21sWA+6TPo=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl62HpkcHB/xanbbc80tjw3ThAw4qOkt7npyQ/lu1u
 npC+fOlHaUsDGJcDLJiiixmD4W+8Mzzer/h5dZOmDmsTCBDGLg4BWAi9zgY/rtM0Hm/P3KDQEOp
 dFH83KNGuxdPv947OWSlddbdP7+l95xnZLi0JjJ+86e0vNl19bnPGlaF5U61z17zdfnPaQn1va+
 ze5gB
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The Tegra20 boot ROM hangs on a warm reset if the VDE power partition is
power-gated or clamped. The partition is powered on after a cold boot,
and since the PMC isn't reset by a warm reset, it keeps the state Linux
left it in.

This is currently worked around by the VDE driver, which powers the
partition on from its shutdown callback. That doesn't cover emergency
restarts, such as on a panic, which don't run shutdown callbacks, or the
cases where the VDE driver isn't loaded or hasn't probed yet. The PMC
driver also powers the partition down at probe time, so the cold-boot
state doesn't survive even without the VDE driver.

Power the partition on and remove its clamps from the PMC restart path
instead, right before the main reset. Factor the clamp mask computation
out of __tegra_powergate_remove_clamping() so that it can be shared.

Fixes: 8f0c714ad9be ("media: staging: tegra-vde: Turn ON power domain on shutdown")
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 74 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fcd9a644d97f..3fe4db473905 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -377,6 +377,7 @@ struct tegra_pmc_soc {
 	bool has_tsense_reset;
 	bool has_gpu_clamps;
 	bool needs_mbist_war;
+	bool needs_vde_restart_war;
 	bool has_io_pad_wren;
 	bool maybe_tz_only;
 
@@ -711,11 +712,24 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	return err;
 }
 
+static u32 tegra_powergate_clamp_mask(unsigned int id)
+{
+	/*
+	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
+	 * swapped relatively to the partition ids
+	 */
+	if (id == TEGRA_POWERGATE_VDEC)
+		return BIT(TEGRA_POWERGATE_PCIE);
+
+	if (id == TEGRA_POWERGATE_PCIE)
+		return BIT(TEGRA_POWERGATE_VDEC);
+
+	return BIT(id);
+}
+
 static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 					     unsigned int id)
 {
-	u32 mask;
-
 	mutex_lock(&pmc->powergates_lock);
 
 	/*
@@ -729,18 +743,7 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 		}
 	}
 
-	/*
-	 * Tegra 2 has a bug where PCIE and VDE clamping masks are
-	 * swapped relatively to the partition ids
-	 */
-	if (id == TEGRA_POWERGATE_VDEC)
-		mask = (1 << TEGRA_POWERGATE_PCIE);
-	else if (id == TEGRA_POWERGATE_PCIE)
-		mask = (1 << TEGRA_POWERGATE_VDEC);
-	else
-		mask = (1 << id);
-
-	tegra_pmc_writel(pmc, mask, REMOVE_CLAMPING);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
 
 out:
 	mutex_unlock(&pmc->powergates_lock);
@@ -1189,10 +1192,52 @@ static int tegra_pmc_reboot_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+/*
+ * The Tegra20 boot ROM hangs on a warm reset if the VDE partition is
+ * power-gated or clamped, as it is powered on after a cold boot, so power
+ * it on before resetting. The PMC isn't reset, so the partition keeps its
+ * state.
+ *
+ * This runs with interrupts disabled, so tegra_powergate_set() can't be
+ * used, as it takes a mutex and sleeps. The partition is powered on without
+ * enabling its clocks and deasserting its resets, which the reset takes care
+ * of.
+ */
+static void tegra_pmc_restart_power_up_vde(struct tegra_pmc *pmc)
+{
+	const unsigned int id = TEGRA_POWERGATE_VDEC;
+	unsigned int retries = 3;
+	bool on;
+	int err;
+
+	if (!pmc->soc || !pmc->soc->needs_vde_restart_war)
+		return;
+
+	if (tegra_powergate_state(pmc, id))
+		return;
+
+	do {
+		tegra_pmc_writel(pmc, PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
+		err = read_poll_timeout_atomic(tegra_powergate_state, on, on,
+					       10, 100000, false, pmc, id);
+	} while (err && --retries);
+
+	if (err) {
+		pr_warn("failed to power up VDE partition: %d\n", err);
+		return;
+	}
+
+	udelay(10);
+	tegra_pmc_writel(pmc, tegra_powergate_clamp_mask(id), REMOVE_CLAMPING);
+	udelay(10);
+}
+
 static void tegra_pmc_restart(struct tegra_pmc *pmc)
 {
 	u32 value;
 
+	tegra_pmc_restart_power_up_vde(pmc);
+
 	/* reset everything but PMC_SCRATCH0 and PMC_RST_STATUS */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_MAIN_RST;
@@ -3448,6 +3493,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.has_tsense_reset = false,
 	.has_gpu_clamps = false,
 	.needs_mbist_war = false,
+	.needs_vde_restart_war = true,
 	.has_io_pad_wren = true,
 	.maybe_tz_only = false,
 	.num_io_pads = 0,

-- 
2.56.1

