Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D335C680
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787015974; cv=none; b=M5tODNweXFeiN9FAHE6kedZnZargUblXF16rm2X9bPz/JKuekWFgjsl3BBi6LE0zAflxj+1uI3QMIlj1J00myvl9zidWaA6zUJ24ShJy0FeisL9aV2wziMI/w9Hgcj50H7MyYceewhxrbO10/F8uZvc6gbt6rTBthJm6kOXudC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787015974; c=relaxed/simple;
	bh=+9DJbzpZ8tW/cGE2nLGaoIX39pZZfgkjdnpyQdZ4tGc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 In-Reply-To:References; b=rXfbbG/WLW4l13mjXErYakg4w3kPklng++ZBa24wyszNJGh8GBf9XigA7sLXaFI2TXFv2xrt9xIa5eWO428gutEB4YvSroLRmAWB/xwyrdVK3Rfu55SRRRBwxQ7A9acwXHX6CpeuskIhb5cw6uSX+a+HpFAyn05MYk6HJ0/5srI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkeQEP2i; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkeQEP2i"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84847482584so378591b3a.0
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787015972; x=1787620772; darn=lists.linux.dev;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=GkeQEP2ilFFgW4sCMfyo/JzNiw3KkZ1qkw/wU9Xf5DkI8sAg6le+SFzA/vPngDcdXs
         LrqjV9A2aTlt4WXw0PYjAHFLV3ZAarIJAAnbff1dQoEC7u/f5vmbYdnzYfeYBotp7xBX
         Jxq3eXVfVLdTiEPlBSQ/oTdnIjpnnylo28bnHVMzqA9VPo20pEJw2y/V7op1wfyUC4WQ
         JwVTqmZLovfmpeZQ85c0UxPK8GvrJe4TvM+OX1y+52g0iaCadZzR+8farIBld11tm61B
         ucUGwfvoTY8E9p225YFWG5ZSv7xCf6CR5GxfcSGTNZmGpYblNXI0Dlhis2/RwSvFYbBU
         wAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787015972; x=1787620772;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfkLuSdmwN1ckqZLOyJ0ADFIrM3kNuRenkgg7slseYo=;
        b=IIinMwaGtvNhA0SILOg+ggl9YobAGPs2msAGebdT8jScVQvhaDWDbeF6ygsDMFtwVK
         nIj9j9scpL9jyXPsulNGmmqOLEVu6AipFUgWfnqgSALTzGHTsZZMm6mmWAQWeyD65+LC
         TTKccKDKL4OMaV7i3FCe2bxPv26wY7n0tx934UprOlmiy8zX/io1aTDUc1pqFGp+xjk0
         zo2a5R3uh7LlzpkmoRY9ZobnrWpLJ0J5E4LbqRLjmxp4Y83vjC5WuSHWd1w1TZ5RvVOP
         omDjrLhztD0tufeSNSG0DkJTNSoD/1DbHlVzSLIZISvivciHHuqlCdK0D5rP3mmjN0DE
         AB4g==
X-Forwarded-Encrypted: i=1; AHgh+Ros3/SBd442Z4L/muDPjKz3H6DKkMEFPpUfSS7l6nx8fKMwXaLwTRlajpGqZaWJsKoDG7s=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq7dGEZvQb3qFnmnQWcBujg0yxg6MMpF1HHE3wSnqttMMcBJzY
	/OX2vrGGRlsckTtvvfhrlXw9BFDAAg2t4FcOJxkGlxAfe7bQmuMQlrA1
X-Gm-Gg: AR+sD13uUfinakTBzhrb/CWtLb2X23nIhiqbA9ZsuoVVL5FZ2ZvAbPVIuaSD46O8BEb
	7QV7zIAbLZMaRzuduWXYSLJx2cQDySPLrmv4kZwibIUWdT6+NBBcwY6femwwRuXXNFS6iSGcGDD
	FDNoXpxDeIFBiPeok1y2oxxh+UlC11GdVh5zzeZXIVLMyuwC9e5csYTI434A6UDeow/NptIWlxd
	i3cwcjcQVF7sDXzIH5ONBnmTY2vRAxAINQZhlVEFOqjeK7KdyeOBSjXEAHBMa6uyKHqkzp9jVZU
	qu2ISJCttw2h0BaYuqOP00tEn0J3DppDiqVrhZ3HutV6YEH0U7v+bhTlXeUXnBjr+hFEOabxQkT
	fNEGpXRlXSPLMwP6S2TJJAbvNUtt7ukLAU6lpRmuN/AypKPsNBeRHC3U21xh/8sFxnRTfg+s456
	FSxX3SplLu6Av0r0AP8LznScb2kL97o4YiWFgLzTb3rI2G7mFyu5NNfA==
X-Received: by 2002:a05:6a00:ba8e:b0:848:52bf:4296 with SMTP id d2e1a72fcca58-851bc3ccf5fmr2527196b3a.15.1787015972070;
        Mon, 17 Aug 2026 18:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b3d1099esm1196713b3a.0.2026.08.17.18.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:19:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha AN8855 Switch
Date: Tue, 18 Aug 2026 09:19:25 +0800
Message-ID: <178701596581.1096543.14003915779643840966@gmail.com>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260817082034.20326-6-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com> <20260817082034.20326-6-ansuelsmth@gmail.com>

Hi Christian,

I noticed a possible MDIO bus locking issue in
an8855_core_probe().

The helper an8855_mii_set_page() is declared as:

static int an8855_mii_set_page(struct an8855_core_priv *priv,
                               u8 addr, u8 page)
        __must_hold(&priv->bus->mdio_lock)

and uses __mdiobus_write(). The latter requires the caller to hold
bus->mdio_lock and checks this with lockdep_assert_held_once().

The other callers of an8855_mii_set_page() correctly hold the MDIO bus
lock, for example:

        mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
        ret = an8855_mii_set_page(priv, addr, page);
        ...
        mutex_unlock(&bus->mdio_lock);

However, an8855_core_probe() calls the same helper directly:

        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);

The MDIO device probe path does not hold bus->mdio_lock around the
driver's probe callback. Therefore this call can trigger the lockdep
assertion, and the MDIO page-select write is not protected by the MDIO
bus lock against concurrent accesses to the same bus.

Could this be changed to take the bus lock around the call, for example:

        mutex_lock(&priv->bus->mdio_lock);
        ret = an8855_mii_set_page(priv, priv->switch_addr,
                                  AN8855_PHY_PAGE_STANDARD);
        mutex_unlock(&priv->bus->mdio_lock);
        if (ret)
                return ret;

Alternatively, if there is a reason why the probe path is serialized by
another mechanism, it would be useful to document that assumption and
annotate the call accordingly.

I don't think changing an8855_mii_set_page() to use mdiobus_write() would
be appropriate, since the helper is also called by paths that already
hold mdio_lock; that could result in recursive locking. Keeping the
helper as an unlocked MDIO primitive with an explicit locking contract
seems reasonable, but the probe caller appears to need the missing lock.

This is a discussion and fix suggestion rather than a request to redesign
the series. Please let me know if I am missing an existing serialization
guarantee in the MDIO device probe path.

Thanks,
Wayen

