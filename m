Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13547244687;
	Wed, 29 Jul 2026 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345399; cv=none; b=aTD2ezmYAJfAOAli80y+HQNaIB7NWhgblcKU6GdrJQmpXtE1WSBdhuY+pLQlDyezwjCdkxCru/oLqVKWeojK5VdbXTkuzbkMpkHDAyx6rETTtvDR9fcyz0u21l7QIGN7awGZrkvOq2moQT/8UG0bBhTvkUymMbuW7YanJgZWMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345399; c=relaxed/simple;
	bh=B5D87pMs0qROF5iU4sO2JwVH+y8ZhgRtnKGKsdhWgZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N+b53sWtiTW3gkoGqRH1UfCVsyaB6IscEV8Bfg55SMIbNkIIym/qKQzgpXWlDOobQzV1Y0sheCrvtQvHY8MHQbb9WE08NkfjmRrKnWn5Jz0pK7br01erWCxBdwbGJAD8SXYBgwuGU7mBSiPas8lf/YVRmgFQN+B7bYKMPaIkXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTIZ1Iml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTIZ1Iml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A111F00A3D;
	Wed, 29 Jul 2026 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345398;
	bh=RpBPAcTnPM7QPcrdtmSZacGemqNzN+8DVJjMTz2Lohc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTIZ1Iml4GjRNlvEmbej+eBuSmNC/B7qe2Cy/2N4LTWPxJ7sPQGov5fmUiD5Sr7qF
	 xTxFBn2w0EPIApp48zQ1A9wveCY47LMyZbIIAdDOuilHGdoX4Uf/hzCVNSLUm+nqJM
	 vvR+g2nKd0ARmoESdi9E8EhRVc5GvgUCxKWt2X00tIKWEyeqqHkfaEFWNhliaOL+r5
	 MPTjkYBSRN0nzcUEFunpjg6iUB2IlZsFssxyDvI8eRd/rgbpCsFCndI2LbIQ53qrle
	 lyKb2/I5qjBK22MRxouI5PPwnqIhC1/e2DBP5V40v7hG2IkGSjKf5XKGeoJyhgBu/0
	 Mptw97ScC7Wpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 08/10] net: dsa: mt7530: move MDIO bus
 locking into regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260728154846.1828945-9-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:37 +0000
Message-Id: <20260729171637.A0A111F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Daniel Golle <daniel@makrotopia.org>
>=20
> The switch register regmap was created with .disable_locking =3D true,
> relying on callers to manually lock the MDIO bus. Move the locking
> into the regmap using .lock/.unlock callbacks, matching the PCS
> regmaps that already do this. This allows any code path reaching the
> regmap to be automatically protected.
>=20
> With regmap handling bus locking, the manual mt7530_mutex_lock/unlock
> wrappers in mt7530_write(), _mt7530_read(), mt7530_rmw() and
> mt7530_port_change_mtu() become redundant and are removed.
>=20
> The MT7531 indirect PHY access functions need serialization of their
> multi-step register sequences, but no longer need to hold bus->mdio_lock
> across the whole operation. Switch them to reg_mutex.
> [ ... ]
> -	mt7530_mutex_unlock(priv);
> +	mutex_unlock(&priv->reg_mutex);
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D8

