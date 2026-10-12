Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4B3EEAE5
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806659; cv=none; b=s7PQHIdJ7240N4h/nQIrcf5PUh8DfbPwiqx/ypFTd5wJKGfLv8P04LQv4UQq+gNq8BOSk1tavvTu/9OFU4yvsIVqESVz6T1j+iBo4BJbQuZFm1efduPo3XMzKo28q02jB9I4nzz6OPdez5yqKqirRmQbl71mPIoUDGJUNbu/L9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806659; c=relaxed/simple;
	bh=Agg4QPystQPs2JjR4AaaDRI7V4S04XaGdJsO2+SBdZk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1hOEK7TD74L9M3JkfCWSpfnhIdYvnj9vKHo9EKso0YkLmaIkhs3wbujOWqpHTFE5W2mWllB18EZhg0DP3GPsQQdrJmbddiObyIB0DcVA3GhddtuMDbfdN+Cf1P8zSq1mEobR3T3E0E8BxwFj+KqXBmIdA8q+ZaqDTPrQ0FJLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjd0FR5d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjd0FR5d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a02718da81so13659395e9.1
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806656; x=1792411456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=pjd0FR5d0+slkAMVgDHCmU+6jUWwMQKQLD6RzQCYkA+G6MXlyVkDnu/SwvkIulh4l9
         AbP/m3uHb7g67xMm9FHpxyl83Xbvn54tM/NvXb87pn9tMN1Gnx6I/GiFKChZ+RmosCTo
         ox3lF96yjjz/4r2+YHqgUh/WZleLcXULv6J1CfI5p2KwOp0+8fkEWRYGeifhjSVEERyL
         Qi6tUwAhXnoDhLKjgVc+sgCyGX4pojP2y1OKzIm0Ys6ymnNrZHASZDL7aUcr3Z97Qj8R
         tdgoMOoXwzDjJkzYapI1q6M3n4O8pj6ZH/aRQLt37Tizc3vpz91H68lRbXY5UvuEHYuG
         Y5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806656; x=1792411456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=QxEc5kROZTh5mlDGJCRv41aFjZXAaHlGODKxUhocqrOFTCR1VeQdxoNcDQBYHOh0hq
         Xxa7m7HrpX6uLLX+jw9qEfJiQ7xxYROmdbs6alHhYwCrgXLlTLZenntsA2P/Z0yeVQZK
         czQxcsf3AeCTYgx+CYVxQEAC7rkcteoP4vRks3AfqYKYjfZQc8ynNGjCS5tEKwRfQ2dz
         pD0wQ3jFqeZg1ciAbVPYGbNWGEtu8MxjNq7NPVkmDWp2BvQxhegu80jLlt3W79/1ETki
         HHrL3ytXBxRWkH1oM9k6O9a1aUO3n4Wd/4ns35zrrOJZwqXve4VtWcbRJw7a6z6EEa3m
         eqnA==
X-Gm-Message-State: AFq9FYJHWh5lWd8WNG9uDnhrtvArGyYhnfdSjrg1LTI8BpK0beX0oTBi
	HO16IUSY9649ofHNE5ezl0665vHIUUpYFZ8LEhE9QtiX9IATefrx17vc
X-Gm-Gg: AYBFou3leJi+XNdjRaYzXhYkt4aG4yNmqyWwKJTCnyP8Rwbv4nnf0z5UWrByrY4J005
	4WNpR4+gmmG9ocvQ/2fPFUNCEDEN9p/RBD2yU+v/1sjDec44t0pE+kp0r+6g0rxC7pWFCIu4J4k
	QbChJX2NWl+p5Y00euZD6FGPacS7hLR1eGGYLejKQDdWsWZ5O+74S42ikI8ksfOGyiOG7Wa7rWQ
	FkuFaqMcOaqtY9PYh8ziz26a9f9PpXvnO6JNyaK7H2/AcxdaZ3WeR5Iy29ufo3NFHDJRQvm6Mj7
	IK6GJ2nVP+7PZtVkCeYaIhYIwVFiP4ynHDxy89LNGsTNwbEwlayWN1SOejoKuL5HlkobJkBj060
	Bx+Ev34jCm+oEccRDJHmH+z5oe4EjLslVHoDYj24NyWLqKuVjPQR1gqb5pXE48L0CDHE5TbnaEt
	UhZiMCaOcLmMN1CTJTYeZ9Pv85714X0Mj981Vwbez+Zy7dbXy6DcGVzg0N2Y1LLRAnX0kKI2y7m
	S+N9OBVWpruA7e2P9wrTtil9dyK0iZajuALf2yLdB+r/GVkEmEFHLLtnEBtphp2A+rzyl0sPNEA
	DNz6AU4NRYkT7l8=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr186999115e9.19.1791806655972;
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd574sm19738733f8f.34.2026.10.12.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Message-ID: <6accccbf.a6a2e554.42efe.05b4@mx.google.com>
X-Google-Original-Message-ID: <aszMvJmPGCC5LVLW@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:04:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, lee@kernel.org
Subject: Re: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-7-ansuelsmth@gmail.com>
 <sashiko-outbox-166718@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166718@kernel.org>

On Sat, Oct 10, 2026 at 04:11:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: dsa: airoha/mtk eth: hardware offload broken for AIROHA tag protocol
> --
> 
> commit feed6f0245d293aabba2178225f4097258a1d66c
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: tag_mtk: add Airoha variant usage of this TAG
> 
> This commit adds a new DSA tag protocol variant for Airoha switches,
> updating the Mediatek tag driver, Kconfig, and Makefile. It also adds
> comments explaining the differences between Airoha AN8855 and the Mediatek
> tag bitmap.
> 
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index 5d12191b6f6f5..9824c63ad50b3 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> [ ... ]
> > @@ -76,6 +77,7 @@ enum dsa_tag_protocol {
> >  	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
> >  	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
> >  	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
> > +	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
> 
> [Severity: High]
> Does adding this new protocol ID require updating the ethernet MAC and PPE
> drivers to recognize it as well?
> 
> For example, looking at airoha_get_dsa_tag() in
> drivers/net/ethernet/airoha/airoha_eth.c:
> 
> 	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
> 		return 0;
> 
> And mtk_uses_dsa() in drivers/net/ethernet/mediatek/mtk_eth_soc.c:
> 
> 	return netdev_uses_dsa(dev) &&
> 	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
> 
> If these are not updated to also accept DSA_TAG_PROTO_AIROHA, will hardware
> tag extraction and PPE hardware flow offloading (like in __mtk_ppe_check_skb()
> and mtk_flow_get_dsa_port()) fail because the strict protocol checks against
> DSA_TAG_PROTO_MTK no longer match?
>

This is irrelevant for this series and can be handled later. I'm not sure
offload can work with the AN8855 external switch.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=6

-- 
	Ansuel
