Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C754D5984
	for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360714; cv=none; b=kgIe1cBjpwT5Y+fzKx42znerCBKo/ENfhJzi0I+uN4m6gUD0/whR25i4RBS2Rk74mDl8FS3ZekDkvlsWwL+RzHgB35RqVb7S/XiHvojRoZelCtShKJNkTGCjbcOYtjiKEk5mhO+evLVa5qMgWMrMzouyNOkiFV7roZ/c2l5WhfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360714; c=relaxed/simple;
	bh=GkosBV7eR2cJr014Lh9fIn7r1IkJ3NflQjoKUGN78wY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txNyY5ziDcD7B5yIw+OTGrcqM4S3RWieBm80pm5BkpD0Rrtb+Gf0bIpKla2bOs1uxRYAOYjfYKn8Ev1NDXr7DkJKRjcC10yzuaEaaJa+DllCQQBng8UHAf/Un8/qWNW2K9E3RT/q+LI8C8qkiYCd50VLQ9z2dOYrn5fvscYyBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7KXpxX8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7KXpxX8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so6262795e9.3
        for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360709; x=1790965509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=F7KXpxX80+AHoMPLboeof0a+zQZUIvo9fJyD3vK1wSITZX0x8DXNB2Rbqo3ANZjGHV
         sB3+m5v4eQzWyN/bt07CN3KsF0AQiq0FvdmrwgkrvCZJ0arnDE1QYiSm6zaGxVG9gAiN
         8xj0HkExr07q29WtZ0UEWxiJ7oxDykydXmdgrv7hYpB48jgOp3qt6DTt5PQCoHP6OGE3
         6jMZV26tLjfL+oUOzPfatLOXyXNyG+OagXoPY8i/LxhxACyx7doIj8lXO6YsydrMkcrO
         e71pxGTe0fbQ1xvsfpP66MZ5T+aIqRkL0LMii1U/l0/qtGHGdgQW0qVIdKzs9SZMhfpS
         MXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360709; x=1790965509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=wNlbC9c0xRwKtywSSQPOtdMId61TSqhGhyb3FBll92U1eVgrBrb+l/7BX9trujxnea
         5uvV+GgaHGZg+neCgX2G9AbPZs8WI+rjTOPVG4qYtCA8WOvJhdjJWUSKNP3LoGLInZdG
         7ihjmeKTdjgwd/5/4B1VOhzBuur1dqM8SIuChvr6MPjgP8NDPaY6b6tceKl25hePg6RO
         GQI/P1q9taBavZJHfB5isfsLdlF0c5Bs5S/OmS4ERlrsRHGcGR2ixJ9J8c6MuX4m9muv
         NKxSvqjH1lY0YCskClNz4kL6lZGftNFIstZ79jzm565TTgdqRFr+XdIVr7UEfXg6qCai
         V9Pg==
X-Forwarded-Encrypted: i=1; AKwUvBzNMYQaDOQQC3zjgtBS/fChH2rWetc3EjvdFuAU81hlKP0gERtP7GYuothP5iwNwr74NeA=@lists.linux.dev
X-Gm-Message-State: AFuF++k4PzuYlxifx8lZY1WiIHicr8vqBEJEAyEctLjHOOik0r9Y1slN
	ri1Q4MAhv/WQybBbFG3Kcny2gQPo1/MRFHgZtTk0pSlFvD8t0jfS8A8R
X-Gm-Gg: AYBFou1JmCox4r7RyjNoPglvPb53sReV4JnQofLQLoQncAd3SU5w1swnJ+L6HzO/Bet
	MMB6N8k1iWp9eJyZjdDNHCE+Fj4P74jyoWFJlpJfOuS2k4/3kNl/YQq3ASC6b1zW6a77MXXI1eO
	TLbzee0uc3vv2NzQ4Ei1WhUGXI4RRuxnz8NIK8fPpbw1Ux1rUpllnx5wLdR4ZrtJlxAgAfET/Pi
	awsMQTSUNDpXu47cZKdL18qnNBbnQFiFkDtiOvwWLQQS6Q2qSqOCie4NDDiz/Ji7QxxkD+sC+Ck
	udv/izMoa1LQuFUM6PhmLZfulWgJ9JPqWI7STEwcew0rSACH5reEJqYJeIVeUvdmEQJo7EGOmvj
	FZ+CBhtBU7+SRA3PDp6I8Oi/cCjccHH9fYZ8TOAXFDhH22WYrQWlUgeSyKpDbMCsiQ7UkpA7G+l
	uGYAZC7rX2R798/Ax3J65lfvmAN37S9DkEJF+P2yE5azHaMZ+wpULlVWvST2y7dXYzimn7Jn+OX
	LLY5+0hfi2L1hvcnWVXctfqdkDNHuYTEdqROOQhxMgedxCxBewdG4KSswlBtzVY
X-Received: by 2002:a05:600c:4704:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fe66ee908mr111606035e9.23.1790360709128;
        Fri, 25 Sep 2026 11:25:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri, 25 Sep 2026 20:24:29 +0200
Message-ID: <20260925182435.21207-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..f6749933aa0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0

