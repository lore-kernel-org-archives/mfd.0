Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236325;
	b=B+YLfWh/GFEH6AOhMQjTF1JWy3dtBKqU07zTyN/b0Dq5Kpr4bcWC+HdKMcCAYpI3xiF8
	 sIaKDQUqG1fDYxtBQEhoXyxLu3sq13k6jwGoYxTOlOoSxE3tXstOmbwnG5U1cIqDg0rXS
	 V1XBl5Fnzup7j/ZMNd8JtxWfdbk8Z1t1RVcScg0O6eGMbzFrWg6m9yktOp90ceC0ml6of
	 8HizK0nirWSCugQ21tzntKGmyeuV8Dt5bKL2psT3LmroxcsTA2yVmodoi7WbIUgYhbue5
	 f4C/LLe4/jEd6exZKOUJt6i9lYIhXqpqnB/olOGMDC3xpe1meIxA5/CE9jiQVsPUE4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rSrsBT8DtXeYVrPrRAzwZbFwulF6KZOD6D/rIsqOAoM=;
	b=QF+gi95aujiMeV+VinJmGoNc6okBrn9hlHI6c/fXT1sFkDfM2oNFWsBovS3sf4coRMcg
	 fW8dDwGn3GppXub9GRrVZCMDdenZ3hfAQGKqxkwyORtjrjQ5/aum+S0zerstjMAoysi7h
	 rHOfydlzMctS5wfYroMRb9G8mD7FryeC/J/Ntfk46zI94yb41RHD2IHZjNwmG7dNOIPF5
	 KOljUdYLrkCo3pA9OmYFDilTD+qrbdpIDaLfzIcLieEsR8q2vODSL3beqQCdIZFF6Xwuh
	 NIYP9bM5jmPVrpww4C1F9aLa2h3HbfotnVz1r7+vF0wh7zOe9qdwwy/od0kel7MCvvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnHRDpof;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422E606A335
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C422E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnHRDpof
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5641f26ce05so344616b6e.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236323; x=1794841123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSrsBT8DtXeYVrPrRAzwZbFwulF6KZOD6D/rIsqOAoM=;
        b=AnHRDpofj77soLrJ84EDm96Eo6+c+k/WxA/ZZwEqOrh3d6KR4r5/roCRAI3HS3E5kD
         j05KhUWUv9u4lYzLirrfe5YI6s0l4AUptVAfTsUO8IVDNKCufK2q6t01Sq2d5YcHecEk
         zFoS2E8osbitPcvtP75wIJ/30/P7C9NfWm5jUikE3TGMFkV6ALcbosL65z2WuF0D+4ge
         npXyYXTEL97z5EkC1AKGPYCgDuUlBAByUgU+Mh8vefNz8cdfUp2dQRrVs+rQDJ2c5p0a
         5ZIEGitDoVU0oyziEzyWP6bCTus7e+9JVNg+PdQBdRiCInG7F4VJoIHsq5ibzr6SYedB
         JPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236323; x=1794841123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSrsBT8DtXeYVrPrRAzwZbFwulF6KZOD6D/rIsqOAoM=;
        b=H5ipf7aSSuRbfyV6wqSbNF54JTY/Lsr6/LeVW2/J0IGgslE7/vh2idYg5IJrIeBsCd
         SDa2xODAiIu5+SRzJkhlbRJK8ufDKpRF83FUfXzAdOk8qO8cHi1+w+GsSax4oq+0UUjl
         9BDTZYap+/9yKYR3M7SHUgl6QOxik937ZEof1ICjAZpxbr4d8O89+KASshVHMTsuivTv
         dT6tBnVoG4vY5mZHRioDCZUfh+YbYpSuso0VUgrCxhpr4PjXPCsLh9+M8AfZkBZvXlt5
         e2Fwi7BgtEc1PHy5LAngGd77p7fn50fYWZqM1ZTdLWaUPAxleRl9CSto+GqAdT2lHrwj
         tcFg==
X-Gm-Message-State: APuU4Z8OiGyflMzkfiWQUQQG/w3iIoz1MwbCObvByw+SD8kH9dDIWZQx
	ZFMMmsf1UNSS/rVbQMNC8w0HCWE0y+6q6UXFQ6jKRu9q5KD03FFkQOy+
X-Gm-Gg: AYBFou3VRUz75ZVBkixT3U8inTZpXisuqaLjRfwS4cJ+tQjiSxUOM6y7dVnu1QILik5
	8Jm7hZXiDHcbkNqK0pX1SRjlzM6Y2If80BDHF1B5Ejy9R6BBZSEdmQK3UCcOKSPkTeUC0ccqR7z
	5oPmvg22NJQVRhBgkZiYo4mjxjAMsIhBpJRr908rLzieMqGyaZBZo5FUcHEB6U6LusFUjTFjcnw
	iCuSbSipb54QMPXcIfp7s4ct3hPPVLJw6JqTXhhpe8eFmpo2vnI1yEsezF/gPqJsiYVLQl2Lca5
	6ya+T2SlO3vdEvfjDUPOVq5yktrPTeNYqfJn6GDcF3LBiUgiXpl4Sj12iJhS4WS8tOW3Rv9u8OM
	2DQEn8Z2wHDkIZYBcOCWHtadwSnOIpftaAnT/ppVez+vcIxxe5e7XFG46ESzELulM8tMUhxY8Ck
	XHPJC4p6basKy1Z/crdu88wDUbp2G9n3YiKOwJx6FV+ytdWm32fXP6jolq/CFj5HRDhDOeg18mY
	rzK/q8kGHfJuURP/BFAYgwOb/gYaApZ9XGxQ/A8Eg1Eyl1hFynECA0CwWTIXUgXje5Lo8D0aCPE
	GS9xihYJPhpK0LVz8szAx6Oc8oOsmA==
X-Received: by 2002:a05:6808:1522:b0:4f4:d914:8603 with SMTP id 5614622812f47-568143a8343mr3216075b6e.15.1794236322638;
        Mon, 09 Nov 2026 06:58:42 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Jacob Cook <jacobmcook1984@gmail.com>
Subject: [PATCH V3 4/7] power: supply: rk817-charger: Resolve boot state of charge from coulomb counter
Date: Mon,  9 Nov 2026 08:58:30 -0600
Message-ID: <20261109145833.1363319-5-macroalpha82@gmail.com>
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

The boot state of charge comes from PWRON_VOL when OFF_CNT reads three
or more and from the coulomb counter otherwise, and both fail in the
field.

PWRON_VOL is sampled at the power-on instant. A power-on caused by
plugging in a charger samples under charge current: on an RG353M it
read above the pack's maximum design voltage while the pack was at
74%. An RG DS was seen holding 2.63V in the register while running.
Either becomes a wrong percentage on every boot that reaches it.

A negative counter was clamped to zero and reported as 0%.

The counter itself keeps counting while the system is off: the same
RG353M, saved at 74% and charged for 1.5 hours powered off, booted
with the counter at full. The BSP driver relies on this: it reads
OFF_CNT into a flag it never uses, consults PWRON_VOL only when
BAT_CON marks a new battery, and adopts the counter when it diverges
from the saved capacity ("system halt last time").

Keep the PWRON_VOL lookup for the first boot, but "guess" the SoC on
boot based on available signals such as the stored NVRAM value, the
state of charge from the battery voltage (which would be high if
charging, or low if discharging, but based on testing within about
10% of the actual value), and the value reported by the gauge. Then,
periodically read the OCV value reported when it is available and
use that to adjust the gauge if it differs too much from what the
OCV says the state of charge should be. This combined with calibrating
to full when the battery stops charging while plugged in should give
us a better way to report an accurate value of the battery's SOC.

Log the counter, saved soc and battery voltage at boot, as the BSP logs
its saved and present capacity, so a counter that diverged from the
saved soc is visible. Report it when debugging is enabled so as to not
spam the dmesg log otherwise.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 241 +++++++++++++++++++++------
 include/linux/mfd/rk808.h            |   2 +
 2 files changed, 190 insertions(+), 53 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 8843871948b9..fe2c949ac5a5 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -95,6 +95,15 @@ struct rk817_charger {
 	int bat_voltage_min_design_uv;
 	int bat_voltage_max_design_uv;
 
+	/* Battery voltage the PMIC sampled when the system powered on. */
+	int boot_voltage_uv;
+
+	/* Rested voltage the gauge latched, 0 if it took no usable pair. */
+	int relax_voltage_uv;
+
+	/* Retained for the ocv-capacity table the recalibration needs. */
+	struct power_supply_battery_info *bat_info;
+
 	/* Values updated periodically by driver for display. */
 	int charge_now_uah;
 	int volt_avg_uv;
@@ -337,6 +346,42 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 	return 0;
 }
 
+/* Calibrated microvolts from one of the gas gauge's 16 bit voltage registers. */
+static int rk817_bat_voltage_uv(struct rk817_charger *charger, unsigned int reg)
+{
+	u8 bulk_reg[2];
+
+	regmap_bulk_read(charger->rk808->regmap, reg, bulk_reg, 2);
+
+	return (charger->voltage_k * get_unaligned_be16(bulk_reg)) +
+		1000 * charger->voltage_b;
+}
+
+/*
+ * Voltage the gauge latched while the battery was resting. Relax mode only
+ * samples below RELAX_THRE_CUR, so this is a true open circuit voltage with
+ * no resistance term. Returns 0 unless the battery is resting now and the
+ * latched pair is inside the pack's design range.
+ */
+static int rk817_bat_relax_voltage_uv(struct rk817_charger *charger)
+{
+	unsigned int need = RK817_RELAX_STS | RK817_RELAX_VOL_UPD;
+	int ret, sts, vol;
+
+	ret = regmap_read(charger->rk808->regmap, RK817_GAS_GAUGE_GG_STS, &sts);
+	if (ret < 0 || (sts & need) != need)
+		return 0;
+
+	vol = max(rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_RELAX_VOL1_H),
+		  rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_RELAX_VOL2_H));
+
+	if (vol < charger->bat_voltage_min_design_uv ||
+	    vol > charger->bat_voltage_max_design_uv)
+		return 0;
+
+	return vol;
+}
+
 static void rk817_read_props(struct rk817_charger *charger)
 {
 	int tmp, reg;
@@ -372,11 +417,8 @@ static void rk817_read_props(struct rk817_charger *charger)
 	charger->soc = charger->charge_now_uah * 100 / charger->fcc_mah;
 
 	/* Update reported voltage. */
-	regmap_bulk_read(charger->rk808->regmap, RK817_GAS_GAUGE_BAT_VOL_H,
-			 bulk_reg, 2);
-	tmp = get_unaligned_be16(bulk_reg);
-	charger->volt_avg_uv = (charger->voltage_k * tmp) + 1000 *
-				charger->voltage_b;
+	charger->volt_avg_uv = rk817_bat_voltage_uv(charger,
+						    RK817_GAS_GAUGE_BAT_VOL_H);
 
 	/*
 	 * Update reported current. Note value from registers is a signed 16
@@ -435,6 +477,8 @@ static void rk817_read_props(struct rk817_charger *charger)
 		charger->charger_input_volt_avg_uv = 0;
 	}
 
+	charger->relax_voltage_uv = rk817_bat_relax_voltage_uv(charger);
+
 	/* Calibrate battery capacity and soc. */
 	rk817_bat_calib_cap(charger);
 }
@@ -751,15 +795,88 @@ static int rk817_read_battery_nvram_values(struct rk817_charger *charger)
 	return 0;
 }
 
+/*
+ * The relax pair is a true rested voltage: where it disagrees with the
+ * tracked soc by more than 5% (chosen arbitrarily), re-init the counter
+ * from it.
+ */
+static void rk817_bat_ocv_recalibrate(struct rk817_charger *charger)
+{
+	int ocv_soc;
+
+	if (!charger->battery_present)
+		return;
+
+	if (!charger->relax_voltage_uv)
+		return;
+
+	ocv_soc = power_supply_batinfo_ocv2cap(charger->bat_info,
+					       charger->relax_voltage_uv,
+					       20) * 1000;
+	if (ocv_soc < 0 || abs(ocv_soc - charger->soc) <= 5000)
+		return;
+
+	dev_dbg(charger->dev,
+		"OCV %duV disagrees with soc, recalibrating (%d -> %d)\n",
+		charger->relax_voltage_uv, charger->soc, ocv_soc);
+	charger->soc = ocv_soc;
+	rk817_initialize_coulumb_counter(charger,
+					 (ocv_soc * charger->fcc_mah) / 100000);
+	rk817_record_battery_nvram_values(charger);
+}
+
+/*
+ * Since we cannot perfectly control the bootloader, we cannot trust the
+ * POWERON_VOL value. Instead, we have to guess with what we have available;
+ * the state of charge saved to NVRAM, the SoC reported by the gauge, and
+ * a lookup of the battery voltage against the OCV table. None of these will
+ * give us a true value of the state of charge, but it should ensure what we
+ * report to userspace is "slightly correct" until we can get an OCV value or
+ * we hit the charge_term_current_ua where we can stop guessing. If we have
+ * only the NVRAM value and the SoC from the gauge, use the NVRAM value if
+ * it's within 10% of the gauge SoC, otherwise use the gauge SoC. If we have
+ * all 3 values, sort them and keep the middle value. Then, drop the first
+ * or 3rd value (whichever is further away) and average the remaining 2 values.
+ */
+static int rk817_select_boot_soc(struct rk817_charger *charger, int gauge_soc,
+				 int table_soc, int nvram_soc)
+{
+	int soc[3];
+
+	if (table_soc <= 0) {
+		if (abs(gauge_soc - nvram_soc) >= 10000)
+			return gauge_soc;
+		return nvram_soc;
+	}
+
+	/* Sort the values so we can drop the outlier */
+	soc[0] = gauge_soc;
+	soc[1] = table_soc;
+	soc[2] = nvram_soc;
+
+	if (soc[0] > soc[1])
+		swap(soc[0], soc[1]);
+	if (soc[1] > soc[2])
+		swap(soc[1], soc[2]);
+	if (soc[0] > soc[1])
+		swap(soc[0], soc[1]);
+
+	/* Drop whichever end is further from the middle and average the rest. */
+	if (soc[1] - soc[0] > soc[2] - soc[1])
+		return (soc[1] + soc[2]) / 2;
+
+	return (soc[0] + soc[1]) / 2;
+}
+
 static int
 rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 				struct power_supply_battery_info *bat_info)
 {
+	int ret, reg, tmp, off_cnt, bat_uv, boot_soc, table_soc;
 	struct rk808 *rk808 = charger->rk808;
-	u8 bulk_reg[4];
-	u32 boot_voltage, boot_charge_mah;
-	int ret, reg, off_time, tmp;
+	u32 boot_charge_mah;
 	bool first_boot;
+	u8 bulk_reg[4];
 
 	/*
 	 * Check if the battery is uninitalized. If it is, the coulomb counter
@@ -769,25 +886,22 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 	if (ret < 0)
 		return ret;
 	first_boot = reg & RK817_BAT_CON;
-	/*
-	 * If the battery is uninitialized, use the poweron voltage and an ocv
-	 * lookup to guess our charge. The number won't be very accurate until
-	 * we hit either our minimum voltage (0%) or full charge (100%).
-	 */
+
+	/* PWRON_VOL only refreshes on a real power-on; bound it to the pack. */
+	charger->boot_voltage_uv =
+		clamp(rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_PWRON_VOL_H),
+		      bat_info->voltage_min_design_uv,
+		      bat_info->voltage_max_design_uv);
+
 	if (first_boot) {
-		regmap_bulk_read(rk808->regmap, RK817_GAS_GAUGE_PWRON_VOL_H,
-				 bulk_reg, 2);
-		tmp = get_unaligned_be16(bulk_reg);
-		boot_voltage = (charger->voltage_k * tmp) +
-				1000 * charger->voltage_b;
 		/*
-		 * Since only implementation has no working thermistor, assume
-		 * 20C for OCV lookup. If lookup fails, report error with OCV
-		 * table.
+		 * Nothing has been saved yet, so estimate from the boot
+		 * voltage with an ocv lookup. Since only implementation has
+		 * no working thermistor, assume 20C for that lookup.
 		 */
 		charger->soc = power_supply_batinfo_ocv2cap(bat_info,
-							    boot_voltage,
-							    20) * 1000;
+						charger->boot_voltage_uv,
+						20) * 1000;
 		if (charger->soc < 0)
 			charger->soc = 0;
 
@@ -808,39 +922,45 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 		if (ret < 0)
 			return ret;
 
+		/*
+		 * The coulomb counter keeps counting while the system is off,
+		 * so take it, capped at full, unless it reads invalid; the
+		 * saved soc is then at most one update interval old. A counter
+		 * that is merely wrong is corrected by the next rested relax
+		 * pair.
+		 */
 		regmap_bulk_read(rk808->regmap, RK817_GAS_GAUGE_Q_PRES_H3,
 				 bulk_reg, 4);
 		tmp = get_unaligned_be32(bulk_reg);
-		if (tmp < 0)
-			tmp = 0;
-		boot_charge_mah = ADC_TO_CHARGE_UAH(tmp,
-						    charger->res_div) / 1000;
-		/*
-		 * Check if the coulomb counter has been off for more than 30
-		 * minutes as it tends to drift downward. If so, re-init soc
-		 * with the boot voltage instead. Note the unit values for the
-		 * OFF_CNT register appear to be in decaminutes and stops
-		 * counting at 2550 (0xFF) minutes. BSP kernel used OCV, but
-		 * for me occasionally that would show invalid values. Boot
-		 * voltage is only accurate for me on first poweron (not
-		 * reboots), but we shouldn't ever encounter an OFF_CNT more
-		 * than 0 on a reboot anyway.
-		 */
-		regmap_read(rk808->regmap, RK817_GAS_GAUGE_OFF_CNT, &off_time);
-		if (off_time >= 3) {
-			regmap_bulk_read(rk808->regmap,
-					 RK817_GAS_GAUGE_PWRON_VOL_H,
-					 bulk_reg, 2);
-			tmp = get_unaligned_be16(bulk_reg);
-			boot_voltage = (charger->voltage_k * tmp) +
-					1000 * charger->voltage_b;
-			charger->soc =
-				power_supply_batinfo_ocv2cap(bat_info,
-							     boot_voltage,
-							     20) * 1000;
+		regmap_read(rk808->regmap, RK817_GAS_GAUGE_OFF_CNT, &off_cnt);
+		bat_uv = rk817_bat_voltage_uv(charger, RK817_GAS_GAUGE_BAT_VOL_H);
+		dev_dbg(charger->dev,
+			"boot: counter %d uAh, saved soc %d, fcc %d mAh, battery %d uV, off_cnt %d\n",
+			tmp > 0 ? ADC_TO_CHARGE_UAH(tmp, charger->res_div) : 0,
+			charger->soc, charger->fcc_mah, bat_uv, off_cnt);
+		if (tmp > 0) {
+			boot_charge_mah = ADC_TO_CHARGE_UAH(tmp,
+							    charger->res_div) / 1000;
+			if (boot_charge_mah > charger->fcc_mah)
+				boot_charge_mah = charger->fcc_mah;
+			boot_soc = boot_charge_mah * 100000 / charger->fcc_mah;
+
+			/*
+			 * The gauge re-derives this count from its own ocv
+			 * model while the pack rests, so bound it with the ocv
+			 * table: under load the terminal voltage sits below the
+			 * open circuit voltage, making the table a floor, and
+			 * under charge above it, making it a ceiling on any
+			 * saved soc that would displace the counter.
+			 */
+			table_soc = power_supply_batinfo_ocv2cap(bat_info, bat_uv,
+								 20) * 1000;
+
+			charger->soc = rk817_select_boot_soc(charger, boot_soc,
+							     table_soc, charger->soc);
 		} else {
-			charger->soc = (boot_charge_mah * 1000 * 100 /
-					charger->fcc_mah);
+			dev_dbg(charger->dev,
+				"coulomb counter invalid, keeping saved soc\n");
 		}
 	}
 
@@ -1046,6 +1166,7 @@ static void rk817_charging_monitor(struct work_struct *work)
 	charger = container_of(work, struct rk817_charger, work.work);
 
 	rk817_read_props(charger);
+	rk817_bat_ocv_recalibrate(charger);
 
 	/* Run every 8 seconds like the BSP driver did. */
 	queue_delayed_work(system_percpu_wq, &charger->work, msecs_to_jiffies(8000));
@@ -1058,6 +1179,13 @@ static void rk817_cleanup_node(void *data)
 	of_node_put(node);
 }
 
+static void rk817_put_battery_info(void *data)
+{
+	struct rk817_charger *charger = data;
+
+	power_supply_put_battery_info(charger->bat_ps, charger->bat_info);
+}
+
 static int rk817_charger_probe(struct platform_device *pdev)
 {
 	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
@@ -1174,7 +1302,14 @@ static int rk817_charger_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	power_supply_put_battery_info(charger->bat_ps, bat_info);
+	/*
+	 * Keep the battery info: the periodic recalibration needs its
+	 * ocv-capacity table for as long as the driver is bound.
+	 */
+	charger->bat_info = bat_info;
+	ret = devm_add_action_or_reset(dev, rk817_put_battery_info, charger);
+	if (ret)
+		return ret;
 
 	plugin_irq = platform_get_irq(pdev, 0);
 	if (plugin_irq < 0)
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c..72419d311626 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1211,6 +1211,8 @@ enum rk809_reg_id {
 
 #define RK817_GAS_GAUGE_RELAX_THRE_H	0x58
 #define RK817_GAS_GAUGE_RELAX_THRE_L	0x59
+#define RK817_GAS_GAUGE_RELAX_VOL1_H	0x5a
+#define RK817_GAS_GAUGE_RELAX_VOL2_H	0x5c
 #define RK817_GAS_GAUGE_OCV_THRE_VOL	0x62
 #define RK817_GAS_GAUGE_OCV_VOL_H	0x63
 #define RK817_GAS_GAUGE_OCV_VOL_L	0x64
-- 
2.53.0

