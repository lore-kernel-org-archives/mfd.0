Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB0C4AA58F
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486359; cv=none; b=PjxDFcwi0FfMQVHnuqBJbkt5eVi7y2jJAE3MycFkiCz5O2fD7kmwsRrfEQsRwu4Ty2vmDyuiwSocsyr01BqGZnpcDCNpUO3qviycrvIx31TjWAWEKXCm8gYoYiVL/se3gp7au4YD1J6joD4dJQUC3Fq0u9itwkrPxCdr5xoC4cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486359; c=relaxed/simple;
	bh=aJ9CiiaReyjoT7VAG+L4EuVeUKwfRtqZpgJXybLsz5c=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=Gqf0H24bGDc5KfYdAhkmuaL3KdKvWvnoQTEg7el22eSaapEFMvcu+CWz4+96M2BQ2HUnHaVeffSWIBS+XhqgLpfR2Pd0Iwow1dBzjdc+oH1Ug9KyDnFdHh5R9Ng4pdIT1Jd1F+59nYCP9BvggAdWQ0EgxRy8PTat0qFZ1JZNK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ocfrQhyK; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ocfrQhyK"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153233euoutp0259e286e9af0cf0d264a1c1e31ac813b8~ViFtz4m1G0392703927euoutp02f;
	Tue, 15 Sep 2026 15:32:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260915153233euoutp0259e286e9af0cf0d264a1c1e31ac813b8~ViFtz4m1G0392703927euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486353;
	bh=wBtYFL7Kwh/AbWkuFD4cnzdIXUhpc1coZlgIzXoyZCE=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=ocfrQhyKMWqfPqUCqCUm/qU0dZHDc4Qz5esQj5h4UZpnVumDskYMo/K8UcdPEBiB0
	 s+lZbkP50jAqCBJslsLZ+IrsUkPOfNM8mFuHK18fIaTvziMjQ+ZygszENY+bE4j9X1
	 caLSgd2U3Iff5Ywv2XSbVR9FSgiM4udMdDgK9MAo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e~ViFtkl1xC1214912149eucas1p2e;
	Tue, 15 Sep 2026 15:32:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153231eusmtip19a6ca86b35c8d62c1324b24637525198~ViFr-1w1n0336503365eusmtip1x;
	Tue, 15 Sep 2026 15:32:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:19 +0200
Subject: [PATCH v4 11/20] drm/bridge: inno-hdmi: Make the PHY configuration
 table optional
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-11-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
X-EPHeader: CA
X-CMS-RootMailID: 20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153233eucas1p2e26a6953a31c5f836aeaed03a4ae325e@eucas1p2.samsung.com>

The pre-emphasis and drive-strength values in inno_hdmi_phy_config, and
the registers they are written to, belong to the PHY integrated into the
controller. A platform whose PHY is a separate device has neither, and
its own .mode_valid already validates the pixel clock against the real
PHY, so the table only bounds the generic check.

Let such a platform omit the table: skip the integrated-PHY register
writes in the power-up path and the table lookup in .mode_valid when it
is absent. Platforms that supply one are unaffected.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 00450250336adb9530894af767034572d775a8df..0988775e7e4881a84f59efda8465ad4d5e61b4cd 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -538,8 +538,14 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 			       unsigned long mpixelclock)
 {
 	struct inno_hdmi_phy_config *phy_config;
-	int ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
+	int ret;
+
+	inno_hdmi_sys_power(hdmi, false);
+
+	if (!hdmi->plat_data->phy_configs)
+		goto out;
 
+	ret = inno_hdmi_find_phy_config(hdmi, mpixelclock);
 	if (ret < 0) {
 		phy_config = hdmi->plat_data->default_phy_config;
 		DRM_DEV_ERROR(hdmi->dev,
@@ -549,8 +555,6 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 		phy_config = &hdmi->plat_data->phy_configs[ret];
 	}
 
-	inno_hdmi_sys_power(hdmi, false);
-
 	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, phy_config->pre_emphasis);
 	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, phy_config->voltage_level_control);
 	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
@@ -560,6 +564,7 @@ static void inno_hdmi_power_up(struct inno_hdmi *hdmi,
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
 	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
+out:
 	inno_hdmi_sys_power(hdmi, true);
 };
 
@@ -836,7 +841,8 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (mpixelclk < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
-	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+	if (hdmi->plat_data->phy_configs &&
+	    inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
 	if (plat_ops && plat_ops->mode_valid) {
@@ -1118,11 +1124,6 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	int irq;
 	int ret;
 
-	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
-		dev_err(dev, "Missing platform PHY ops\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
 	if (IS_ERR(hdmi))
 		return ERR_CAST(hdmi);

-- 
2.34.1

