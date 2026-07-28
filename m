Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9532E141
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253773; cv=none; b=APUB+12RAozo1wmJ+3KQwAk03GZ+LCFvdegv6mekWPCMp7vnTvQ7dZKUHqUOfJmKdYY2tMZGwT3bSw6elekqY3YCX+4+CRJAmgpEUtI4ZCs0vX8+JBTJlIzN3gFlgCrMkqoHaDXy+jqjK14JUaUXoCc3HQP1pj9xPO7z7HKvqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253773; c=relaxed/simple;
	bh=DgL5CromPu7wbZamQo6dcKhpSqi5faC4TnVOwOj2opM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b35CXUZPK01APwySqbN0DKpfBOukewI7pe061R9Obd4xZVRxWDb2HPgYRR2LA9LEiVKhMDb0InzSgPWcHOeDvKjWd28v7EQPdoS7wJ5ocu1WlUnO6TjZhO7+EoQ7gWM4GSM9NyQnHR3GHRDmfJ+BLye0Ib5oLHRhJuUAlOmBGxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fn8f52Bl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fn8f52Bl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so36744165e9.2
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253770; x=1785858570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=Fn8f52Bl+7CD7OgVUDg/loVRXN0GXAvRYCQwjk488hDjc0j1qw42bXiC0tJS8YjTaY
         h9t7l1+7C6slUVbpfSCitGqJznZ+wuhJpw+/f2M6VrrHJd9M8T4H9ywTZhIdXy8vfl5U
         WAA7ireYwSDCqUSFCsETuIBqJhsWLhAOyigPW9OcgcPGcuNJr4KNK8m8w2xZJ4D9ZIn9
         jyyb4Bv9ES6dx8in/FVIiq1PbpLoqj9ppgH+s51ON6MjKGQkL2VllkomtBquOi/UhaK1
         gO7A3jAcHOJ3iT08I7YzpQU2O4GCLhbXzOK9GatLkwCw/zVj0RgHjDdMGrmQigMS8oGJ
         CZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253770; x=1785858570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=foFk8F1wdsuWT3Dh0z0pWEWTbLvlSNuNG+sknbc1YSU=;
        b=XpTmSdj8WeizqQGmKykgPNpeXkgIQ23J7q8seX0XibSFs9B28xhJHSR7nYJaSvCXog
         VKwg+bUj4utY8uMZwDbrSqMP7T7ZkSqMrPEoCpyqWbEtkfikeYUnLchFcMpNVll7pdev
         ZqR4scP6F+jjSVsDPr26PCfpR76feCBsqk90oSpQO4HvTisTNvApm4V7488PGXic+e6u
         +PJBrnsgyQp9D7boZC8KpPF7geqJ37itqOVKPFrbMebAiZYe4AYzXFMEegK7Atz0X7nT
         LI7/Vcg8p7wO9iA41/ArtuIlsb1UiNCCK0EfLDmNnv/Mwrkys80xhuVZeO+Zj1hL6SgL
         P9hQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMQInmMVCcVErUy76ZHBuDFngHT8e5XQVxa1vbChNfK+d2mzhdhoDCcZdkGESX5ukFY/g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhho4ww9VYBHaFg996HW7WchQ+9JA+/72fKFBlYdqzuKqcOBT7
	rGJXJIDuTFqlCeTraAFzwrs0bZmrX4U6RGTGvUW4L05ERqTBrMGMTuVN
X-Gm-Gg: AR+sD11SZ8a1KBbLHXd0mEBDa8W8BIoDyToP+DEN1LCXwReYlw9XGhjgNWDDtGlmHI+
	YtuI8a5MfSqEg53RnFeCh/3NxIxBODdOb1rKTC+tP/Jbn6ihFQzbNNJvjDJq1NOPcVZiwdUfleI
	P7RN9D+D2chrxWClfTjd/MOGswFoHqhqqpnFAjUkK3WjldxRz+4EoBX5SmyhaZiYiHnRvtoZXfp
	l9F8aYQq6r+Na2X3QnMLIj5qXUSet2nJTxidKrWs0RiqYPidwEnyed3fnUlp6P+TCoi1fo45pCO
	Tx52j7wLoNCcGpdnWPMZ/Cg2rybAV+i9xFUhh82YcvkJPgNakzcbhSk8py4PWkulekY67vvJgxz
	NDBsYeudhdkbQTK8OrCT4n29np9tsiD0FZiEZg5e9IxEGtR0clewQKTqmF5yIxy7vEtBp4aWJbQ
	Vo6Wp/kurb0gco/9P0mQ==
X-Received: by 2002:a05:600c:1c11:b0:495:3a52:cd7e with SMTP id 5b1f17b1804b1-496c657d05fmr34143125e9.25.1785253770337;
        Tue, 28 Jul 2026 08:49:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:29 -0700 (PDT)
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
Subject: [PATCH net-next v19 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Tue, 28 Jul 2026 17:48:34 +0200
Message-ID: <20260728154846.1828945-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
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
index f3218abefd0c..b8580ff98b8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
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

