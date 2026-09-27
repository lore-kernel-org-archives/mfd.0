Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3A3BFAF2
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540069; cv=none; b=jFiLuuKN2rkIQp1IhMlZn4MFCcmYXk/y1MHtigzd9nGtIEG2auhgNVX1XkidRifGDVsP95GJwRwHwn4B382UyYsVBVgcNjT6kRCDKTLjzsgi0si0i1Sl2PRuD2rmUZYKtqBOtp6NhBXMvXT+oEUXtk/ATJ466NmjOxmjveKZ5iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540069; c=relaxed/simple;
	bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYJSR8byvQwzCxnbv/xOk1HMkPQ92SyexbShMaMu49PLM3LJ9oFOujYjoxZNmDU/keJOYMUsn6FOGLXaz00X3jaY0KhIYiEJH2rZiINe1roDYPmZc4cflZRxpL14zIq3mcS6ypPXhgI4ngwPBYAbMZAYMxmc3bL/QIFuduwThuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZMIZuXL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZMIZuXL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso1869549f8f.2
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540065; x=1791144865; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=lZMIZuXL93URZYZPq/tGqL3RFCxcIhmuKb2n7sLIQK/eqWlBZwKIqaPj6nloOF+BAF
         e7c2fUNhvKEzjNFPGgOGHuEQkwIJ6dHMVOn1MoAS0hPobcqv+xXEjXF+sb4iIxmTfFc1
         dLLAV+2U5HUaP44MOLmPCoj7IlKcgqkIR+Y+8oH9HyGYPboIbrQoHq9GxShhV7a+VeJx
         ZZPrMFjrdoNTdfAi2ALs8wIckDRu/BB3MBwuXpUkq4qfXPzkLgmLRbvRzCfuurxNlTol
         e7JD+KmRVjTZBfyhp6anIUncchGexYcOP199OEpIEbLYOkjrXaHs9cSu+4Rxg1Asq0Q5
         xnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540065; x=1791144865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=knRtP6faJflqn1XO1hjcj/p2Vgme4eyM93jJFYe0jhstwmPpmVTrRuv9P8SHVtfvHS
         py09lzCnz8NadLSiYGSpgiiFcTkd6q/EN1k2LIIoLGIpcOkh+VFqJx1GfZVkzXWHWk5o
         fg/pN66orkQhUpIJZmHrL5Ktijx+HyrfxM2jxf0LLEoljuFdrJ3zKCdBM9oR1XstaR89
         9Jvm9P6IeC80lYbUVYqnv/ZklMVFnbTwqJE8EfBcF4UHEoVBysCHg8jB6FQ5VKGhlqjS
         mCMYBMl34IsZNoVwWoTMty8UnzGh41NDQm27hGHxFWFMtLNjBRZXnSSBPtBa3iIdX4j2
         Dd7g==
X-Forwarded-Encrypted: i=1; AKwUvBw2fAq6T3Qk5i9cXFt6ohal8JHKT+y3aARooZxnCaOA3AOwfTcpJObUw5W9vx1MaVhzYX4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKJ8ZGF59f7IMXZfFJ5sZ4nczD1R4cQY5vnhyJlWp0uW+utLahj
	np6Fu7wFTR4hQl4SydP401z6IhdP22iR2JzoxOJnxqT3td57vqxafz5j
X-Gm-Gg: AYBFou1zFwy7xQc1LUx9dJ7+c/Zta9T0qxSyUILHyAx5Y0RsjOHN8GGzDtdZUHzEsQp
	4QvlF1Mc9VMSCQ/bSj030vCj+rLgQhLcR/97S+aC0YM6VWHkqxXPmRnKEQnimExzpuwDqtrkE0q
	/KeZWJBm/9MEOXemzjGuWprfyMgLvChJwgZErTr6zDBc8pFk98RGzgC9hBABz7QPG2aYhqVYdx9
	hohQCKwsYdb65wnuHPO633LxF7VzV5ITch9YgMSMRnRzJJd234VjWo9BMd4dSQN+mgbVaJQnUw9
	cRTtFiUD5bK/qyrcEmpvlPguUL5F0F0EWEVECnE9L36vGZ/Tr6CrGU24nYIrAM0+N1aCeI4dRDj
	3GzGCxPRqCr/nZaIf6oi0gnywSi7o1/uc//vpnwO85QkXLvw/cZwAzyzgpm5Z6KG3sfNZX2s1xO
	r7A7W6N2NnbJdqdqR7ymdKp4+Us+2lnovsNzBIuYfStUm+SHnu43OHq6relA1Meuj/TgphMwbgP
	lUU6YGv
X-Received: by 2002:a05:6000:4026:b0:487:6ef:86b8 with SMTP id ffacd0b85a97d-48872ad79fcmr22373801f8f.49.1790540064665;
        Sun, 27 Sep 2026 13:14:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:24 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:35 +0300
Subject: [PATCH v13 07/13] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-7-70d8f673386c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj1KioYaMuFgpmk6o3fz/pJlbFL7ofGVcvUv
 9YBLo9tepuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKxXhAAmPNWee2nVYKvuarHBJtpA5q2EvCQxub
 WzX5XFy1zIzCVV4rrqRfYZQaYjH5m59qLFa2MrqCFiaOw2VUR/4tymITW2j5MOTnLNem2qEwUos
 l6P3pcpMFV8oY//IS9u7O9x07KA23kxd+bBA0HGYTw/z21YAAHOTlTzfU42KiAc8j7vOqnhscFB
 eIVBMCPwt+DLUYXyPz4G4LuARN2ZKT1Z4QWqd3DrYxFchl9JskT8L2sIHB/P2FUeUkYT7Q6bAyj
 r45q+q8OWzIycB/9dwKHvaR1mjOujAOJu2lvYvSosVE+EmOLZ6EjgBhW9p9qt664Ai5FGcrxBZw
 K9ACtstEZclDtByWBpS9qkZuZvfbbB8ZKSvMmZ62uH7mCjJWNpOc7jINbxdHnZwu7I6YoTT+BA7
 0fMpHZcqqx+XxZ38ZzLt++EU0B1Cr3XxsINWiIZ39MTWaRgjJJygk8IzJ2dRqah38yqbDeeJNCi
 7ZP6X2S+5xvebdpWA8b470J/oINhom6vAYa+nLCtCsBqVpDpZCr5v0roR9jEkL50B0bsfIkdNW0
 czrB89ZdWRX8KJA/ngiKBjKlt8A1f0awyGGwqW90eb7bq05LI5bEWqu6q0S0LAeOJaz31e/L43Z
 fTnzO8SuYHleZEytxND9wB1cAT9HBkIFxKSTmIGkvIXchWA3dNpA=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.55.0

