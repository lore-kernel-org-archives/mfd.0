Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D142D75F
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 22:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167290; cv=none; b=UHT4TnDHEYPpIdtta23zYrrwrkw80gFsCYRGFXfFw8LxJeaTeN/BJFpipf2r21A2jL+nYfC9GN0TkzduQtOCLN1wEkoPdCM3sfQDclx5lHhv1nCA6rZKYzqDaNiflgbB6fBUl9u2vu2019sGbxKWlf+gRlUw+W/yBXnnKEUj//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167290; c=relaxed/simple;
	bh=Knp/omcxHZjUeiGAM1oWy8zX3ZBEfkEUke0tYS6i/Bo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sko1TD08DMRTolykKf89iaIUMTvraYCJBwYxAKwB8rwLD5pl7rbf6SaiTTtO7Rb7cfxBX6vSPWEDDJCLpGqgF3Dx1eEXmHhQFATKjdGAT2x7/evqg0OojaJpaQrmjWvNVD4q8kU3t4lr/pyFZGI77fi2cMeHqKc8zSVbq2pdJF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrROfxzw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrROfxzw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso3032405e9.3
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167287; x=1789772087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=ZrROfxzwvwo9cXdO610igOAGc5V8sUaHPTqoATVeo4hk0+SA/GMcH8fZRGEwzxbA2p
         XJa0qMyFF2FMeN2CQpIatAdDTH1ao3VNS+9hv+M85Op3OMkWbuBB7klP/3hftuHuF6v/
         6whCmC7r/Vy6/se7hhFxdA/eEnrgUOePvy72trLzU0STylTV6Ia/tXVsDmgp/HNknJbA
         YIvboonPQ72XE5BN1e3g71cTpEzv1H5HGiQvwKChWK9qDD3fYJ6UODjDwtk2x6T7of5/
         N0IxPfdI6oBnxcp6NDgd2VsnNwKqDX+uCHExjqigetarKOE6+cfPhmEHNszoNZc2Kk4W
         MmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167287; x=1789772087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4x6skfRoPug9nQpkDIHkliB3IJCFQOtgzSpXl6Smj9I=;
        b=C5bUqzkWbeFhnpFkl/BB2PVqzuH7TnsSyHcMFw6K8GbxjYCB05DG6KWlNdPPJe9/6T
         bMLstY12jhGD5Uy+jAIFqaMDtHYaDdcUB6d7IZkTxhHRDrS+h/W5ru3UmQToOuBPsR1B
         4UczQ/CBG/TpyCO1qwkev3kGBQOujYpK7PhuHKltR3jxEYIXUVRvnMI7utud6nbiZFTE
         6OteXRZCLVbwDr3SVpz0WUHMQL7DCAiT7J/Ha88oN/qP/LWXhMiTmX17ulseZuwbAdgA
         93rPRUbV4PByFORBB/k8sfVyEaNyvZfvmeIREnYorxY5ER/KelFUZlepqmv2Dlrzn8bn
         agNg==
X-Forwarded-Encrypted: i=1; AKwUvByEboN+TwVGdwfoSyJ51fZUclSZLqjgff3QIQsuC4h0Ue1KNSWkAq5px+XCN0P78P5rD28=@lists.linux.dev
X-Gm-Message-State: AFuF++mQ4DgNNSfJFHLhvmFvMZwxXw84Vsmrv22zubn1N+4ZyQPKex2H
	9c4TTJxauDMn4sAjvl8mPKAXo/P+oIRmhZPoXwho63xeHUdxHBwAun0i
X-Gm-Gg: AYBFou3Eol1YHnAHRgHhbvkP76vrP5v9j5UPkQBcIbEU17hM8iOQvL2p4WRcmR44Lbz
	/6kgi9RirNk+ixZ+BWSZCn/rMTCnMTeKUmkTqD5yG5YptJDelUQ51QoJlXa/isNzwobt3Z/T5Vn
	i92kgR76dBoLAWh4GNCi4AxxmS+/KNXhRr7Ffj8aDLV+dcLFhTmIwrp4AjDKqQPX8NUEdBlJ/RE
	U81iUBGCW5w5Xek1VbZ5dpztKYcsT2CtgNhItE/pCJe7VKKIr9XlfO0eOo8dUKtwJtzAHNOHVPE
	W/DIGPnM3A4BDQtngXtices8V+3iX4DrNeM2Ahpaefig7a0N7ZdUdN6wqUqFKKbtG77zW4MUD3u
	YZtKEW9AB4iZMnqxJVSe7i+aMnGazwogb8jNltLmDnKBF/yfex2IKlN63KBXP+xCmb+vArjiOCq
	H3Hl8ZpHZ0+RtFBdBuPM+1qjjF3Dm/G1V0qPQj9Vrxhqi1OpIe6sYa3SmiphzWHO9Z/Wg3ORidL
	r4laxYLKVVQngpAXmP8hLWizf9brsmQBt6vAUnGZLpiTH/7bbzNSOCClSfhbyg=
X-Received: by 2002:a05:600c:a107:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e663cc929mr90961875e9.15.1789167287028;
        Fri, 11 Sep 2026 15:54:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:46 -0700 (PDT)
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
Subject: [PATCH net-next v21 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Sat, 12 Sep 2026 00:53:31 +0200
Message-ID: <20260911225414.225980-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
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
index 878ecf1fdf27..95072863b236 100644
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

