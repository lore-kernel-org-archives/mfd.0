Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82E4A4984
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475921; cv=none; b=Di7gPFHFejAvXnzfL0FP3IsweJERq/dCUrTVOxVS6f/DtNOz1pQ5oADItBqMAxXBnttQu/vDm7QJ3+RzF35RFI5AzknrREF1rIcJFpogAhj80qt6h8qrEDzGrWYOYUejAX6tH0LUL1ss80PT2mcEn0FA1gb+albq19HMZx4XOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475921; c=relaxed/simple;
	bh=EcLMSIMPzyh+0/FB0Gs6lMGD0LoZklRZjkrW967TF1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRyo5F1T6G/KGK0k631/2005BkJa+K85nL/g+YTWmHVsot8RvaKdINtIn3aqJ1dA8iM2K4f43JYCi23oFjbx90e5Ohab94s/EJ52mYkyrkMBIE1pg/S2rCeFGNwTXjgMtloMgYlKqW61C7c5S6P4wDZOjOIH4YWvPVy5qv77pqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJnsIL5O; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJnsIL5O"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so1668835e9.0
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475918; x=1790080718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=bJnsIL5OtUqO3qs+Dd57eIFALJ7l2JljPimFZrouaxOqgMZaFprcnFOKzM6XYkekL2
         K8VdqZ0In3r3/O11iaKDijAw4tu5huV/HaTCMuXa0y0Tg6Vmk0f4L8e6BlEdjm14iqxH
         pQjtYjHgewyA/LPd+EJNatm1m6HADlF4h3i/MNWykyB1pCLsqQZMSJbX8cJM+VNzT0T/
         MBQ7OWQV5HrM4ynXnaNtBUfTaRe0XT8s/jIz0Pc5n/pXxFmwhLnHoY+ZIbs8nION605u
         4Sl0KH4d2EKyqKKBy2jtnlUv1B79BYHGSUX9+1EVsVbRZM0+4L8T7RPTqW8y2c4K4HTD
         ySAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475918; x=1790080718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DiXn+phYCGaEDpGaEGNQSOv3DEFlZqBn0YDd/SEo94=;
        b=WFqTDWzupv4eAupMFqrd9cM8fFfRSQq6Qb9IZ7EGoddBHK2LH6hvAt4ZF6ctJtovzL
         hEXx0eRSkwfCumB2Nud+sMbLyVfyF4nfabmn1AYxzMxzKGAcw35Rmj8jkBlLJyURNV4j
         ylBbOojeUJg2pQZUy2GNRfv0SvRFiXWn8X4/kGclvqj6SQAYgezYCqAN0LNy/iAY80+k
         Qj4bp+12FW0p2vPGkjUvc2AJwq/YLikxWHcUwmSew0d/qf+e8bqTbN6MA9RTWGuFMdAx
         DX6Kylm6/LyBBt8tlbDbbe12oUWTjgEAv/wPafoxCkHRelw38d4laAZKUqBWo/bCxNgp
         0Ttg==
X-Forwarded-Encrypted: i=1; AKwUvBxafCmphTjNa/mvy9z+bhrlt1l7fBJxw9S+vdEWWdLX/uy6RQKAK42MVQjkNHjgPMh1Opo=@lists.linux.dev
X-Gm-Message-State: AFuF++mJyqFAQBl2/Mh4YYjrEWwUy/voNVkvQ4a/fvWVZtmyBIKB5NgN
	dR25LqGZthKpTRctr0jodwP9Sewt6wJNPC5itgquy1OO+qhjmEC5Bdfw
X-Gm-Gg: AYBFou06TOnldxGIG2/B0EYXpLnmj5WQULBA25aCTYwR6hixoWQX6z2SXOARlxamQV6
	4axVqB9ohPMAveWplwcdsO9e5l8XPaixAXzhPQAWo9lxvEaXN0ZXdZpSm+r80ffJ3/nJbHUc/Qi
	4MgZCZ6ZMW4QtUqkwe0hSeRlqdWQeiu653qjUWZZ9Sgb1r8nzLvy13GpqqtpTl87tX+dvHigT1N
	LpMR8TlLH4JXS1wGG+tktvPLOmc49EyhpXl9Z5xP1ZsyX5Pj7auRJTTJpzVsZKt5IAMeucrmbeo
	iOFSr6A1HNOic36vfZvXVQWwVZiR/xaBif2FUPs1w2d1cOGYBw/lF6aPt8DbfLHLByLhQez29B9
	8x9mCrFVBlS2eDI3ILIDT7DTTKpbfQNB4IIc7lM73+PpjYpB/2JEMxzk/8Zskm1DJObdQdekTlc
	OjuilYkAv1YA1Eq/yLbXGIrVRPIbrC03MXL1zqCP2LGg2HBhK8Ci0JyPKJ+wVwhW1NXevYM2siJ
	51uycf+0xPYJIb51bUAw5UmQpXCn6l4bKcscB/6GuKc4yvmnZTRc54PuE1SG4b8/oTN63whsoM=
X-Received: by 2002:a05:600c:1d01:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e8222c825mr13854845e9.6.1789475917733;
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:37 -0700 (PDT)
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
Subject: [PATCH net-next v22 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 15 Sep 2026 14:38:04 +0200
Message-ID: <20260915123812.14747-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
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
index 0e04d92d1b09..afe9d363ddf4 100644
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
2.53.0

