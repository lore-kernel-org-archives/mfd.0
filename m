Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204060;
	b=ikKzVyz1qrJLswCvJ+SOQYIvK6ShT/IkPidb9j4CYdzRl7Ph/GqR+bpjEZS4XdQupvNE
	 6EvHbViiJngdKN50YeRimZnqwuceZpG6YJNXD1KXBrh9L7jy0zL7T1GHgDGbE2nPejGOw
	 fLlIkcQjqi/g0zBUUvEZ6uw/KbfZAC05KEysFfWkj9nj0vviQ/OemMjnuNrIhoqcGxQSM
	 bAFhsPy5kM+N73xnC+nnWW3w/GfyVkfr54Qq//NxfFsltRJ9eolw19B3m2kypnQT7uvqS
	 W/uRbC1b0/ho87wUVKtSwAr48N4EwSUqHUnpeCC/ycFtVOJKtgztdXiRNiZwVgMNpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BPU+sIJxFAGZqhFhvfwbfXA2aJ5mB1U1Q3bQoAW0xC8=;
	b=LWYkPRUs3Qn7fWUIazm9DWn8KipcNFeEH3JV9bKkVNW8kYUGhMNk+GyKB4NCeUU6nWOu
	 QhYcUKOwVNF8kcdLYPC7nw9QX5emPtM09ZODF+ZVc5e5mWPIsy8DGqQKTf9d776TKOiJS
	 rIGswir6PmH2xwyBZiRDCcDQnhkyIJlaphZXrZN0ZpqeJGH2DDsco+VDV1GK52CjBFUKV
	 fzdCV9jkEKSV4AMS2phphGWbsQ//NN0jKUtg46OND/lZDqH289wHPEGexN7TxYRuFGMOc
	 /bMVOdAJQHsAOUbJxsoEl1Vq13BK5df3euPpzH0f5FgViGuJYoFsQEZrLZfZPIsEtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FF6CawEa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7A560A2607;
	Fri, 20 Nov 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FF6CawEa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AB61F000C4;
	Fri, 20 Nov 2026 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204059;
	bh=BPU+sIJxFAGZqhFhvfwbfXA2aJ5mB1U1Q3bQoAW0xC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FF6CawEacrPS6jI3JqI+4HAB4E/Kfeqa1WzsAbPiHFRqxXwlH7IMa+eV3xQ0p6SsT
	 /e1qVv4Z5uUwINIp6cpc7R3iJLH8gKXm+zj0UAXjXwSPFldMi+PoeqAstWbV4c1gXM
	 C8GX1Sx8lgWoe5YsEgedjGaCMcnGRVdWC6kftpfpxdM9y7AgUfPAtP4dF2Kak4TLnl
	 5CIL4WglNDmgZGnZtj8+7DCzIfIRenN2o6gu0gCbpeAJEK7BC2s8Rn3ZBLCle77jUp
	 jb5pCsy8oIc36nCQU4k+ygT0g1rZxuIa1C29Z03+pPC0YTM03Uv+DFruIEmKL1fGlJ
	 47VDpH+l5371Q==
Message-ID: <sashiko-outbox-225958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] phy: zte: Add a zx29 USB PHY driver.
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, lee@kernel.org
In-Reply-To: <20261120-zx29usb-v1-4-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-4-b0433258e51b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:47:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] phy: zte: OF node refcount leak in phy_zx29_probe() via wrong
  helper
--

commit 15ae50d59e0e993615e70ce4fb99a2131fc91c46
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

phy: zte: Add a zx29 USB PHY driver.

This commit adds a PHY driver for the ZTE zx29 USB and HSIC PHYs to
handle reset sequencing and ready status polling in the topcrm syscon.

> diff --git a/drivers/phy/phy-zx29-usb.c b/drivers/phy/phy-zx29-usb.c
> new file mode 100644
> index 0000000000000..8dfbcb468c263
> --- /dev/null
> +++ b/drivers/phy/phy-zx29-usb.c
[ ... ]
> +static int phy_zx29_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_zx29_drv_priv *priv;
> +	unsigned int i;
> +
> +	device_set_of_node_from_dev(dev, dev->parent);

[Severity: Medium]
Should this call platform_device_set_of_node_from_dev(pdev, dev->parent)
instead of device_set_of_node_from_dev()?

device_set_of_node_from_dev() takes a reference on dev->parent->of_node
and sets dev->of_node, but leaves pdev->dev.fwnode NULL.  When the
platform device is released, platform_device_release() drops
pa->pdev.dev.fwnode rather than dev->of_node, leaking the OF node
reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-zx29usb-v1=
-0-b0433258e51b@gmail.com?part=3D4
