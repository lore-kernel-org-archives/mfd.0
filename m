Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585327;
	b=G35hk8iFI0gNlthAuxOVrIbh6TAGn5cCo7LJPnEFPef6zygIzBf/w1WJXy58epTyS+Q/
	 T7yehR151KRM6DtMVkgh8icioPNDKNKZR9nldId42FU5v7Ae75lRH29gWImFdyVOPV35x
	 itDFAScvki4YUp8syDlW2D8Uq+VyH82ZXWJf0SJ8goBnhl+f39ceZ+TPpr45dRDViCAjm
	 ovXFdqjG493/xJKjK5nBi55Mgq1eL6weaIjNcW8X+2T+GvBewMQSl4qwLS5Cs6ojzdvub
	 Y0PRQ59ODxJ3XpHrwE0bDJZev9s2w9ClA42r+rljbbXoEEwQnxoe3oBbzVNJAglDNmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5SeHPDot5HZOXSxWMMGikzrk3QQqIs2FC/TR5vgv2hY=;
	b=NY7wkoEG3pf+QBgIHrOmwKZfLUGSf11oLn5hte2kOZqEp3qVJ5qt1L24zFM5SnVUFcGJ
	 HHgP96H/nb4Dxv+0cfLyjIcYGNT8PXMdR4uG0HM2xNSK7adXljM8dSleLikOIk4GPjVHt
	 IIdyjbmIBFK7DbHqxVDJxutvW3ZCs7tyNMdY4OD6KHf/XrkQ3BO6BomBfe6EtZNqgEwIq
	 EBd3TiCqbR6rZZg/U7B/Jq1gVr/R6bqz9PYtOHC/osbnLYwh7GvR24Dyt5punuAfDl7wY
	 uEbns5Kk2M71v4zq/bGVhFLs4snu8iyhD2OPekHOHyu94ObXSoRy2O5lkx/xdS5ie6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngaj6k6p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0F606A32A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngaj6k6p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEFC1F000C5;
	Wed, 21 Oct 2026 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585326;
	bh=5SeHPDot5HZOXSxWMMGikzrk3QQqIs2FC/TR5vgv2hY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Ngaj6k6pTgnWMujbzkcAVqdmB99LC+IOZexVA+x4VTh9IRr660Mv1jTgBjZ3APicF
	 9L5jOEVvNVEFa1vSRZRMzv68BY22uElWNNzMQcY5aEhCWIsVb6nlukvI41BugKuz3/
	 z323P6aG3XJOWy4x199iBiA6eK+0NfVzOD9URiOYYt8OtgsJqZMCcTNyEHo3MsfN6/
	 wiVcJawIu4+bF6zn5tkvTInX4eHkxdAzWMU/dpOFt6xV+3InS81A3YYRzxGEov59PK
	 Vw3LpNxRQ5LiMXLK6ZOjukz5w9WYXqvSD+nVFZJqx40uZ4AQ1kmbmwf91sVtD7EsUH
	 0IHFkbq6rye+w==
Message-ID: <sashiko-outbox-180234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/28] mfd: twl-core: Clear pm_power_off callback in
 twl_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-13-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-13-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:22:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When a TWL6030-class device is configured as the system power
> controller, twl_probe() registers twl6030_power_off() as the global
> pm_power_off callback.  However, twl_remove() does not clear
> pm_power_off when tearing down the device on late probe failure or
> driver unbind, leaving a dangling callback that dereferences the freed
> twl_priv context during system shutdown.
>=20
> Reset pm_power_off to NULL in twl_remove() when it points to
> twl6030_power_off().
>=20
> Fixes: ca9414a1d087 ("mfd: twl-core: Add power off implementation for twl=
603x")
> Closes: https://sashiko.dev/#/bug/linux-f5847f26-c868-416a-b926-3fc3da578=
02d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D13

