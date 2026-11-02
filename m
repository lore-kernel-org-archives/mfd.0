Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622662;
	b=zaM2DlI4VMumPVOfdGSQSLP2vSk1/zY4A2Y2kqyX9m1Ltaul729NuZWlS93121qLfEoP
	 vM8IVeey8/KDVLJcT5BFmVDrgvfmmBTwDctBLUYq400/jUPq4fo6XOuf9JBCJ8IX+VKq5
	 jVpdmI/fME9QblpbseWEz/awQ6lJb3jgVddccasoRtoeRyVdQqu1SPnDsop09UYOB1iDD
	 9Hnxsq+ZfA7Wd7G382TV8psmzefUiEgpw/hUorHUqosw23p613rdPoDP5Nnkbx/qzlDdF
	 vfVi1KITwN57mknkF/tpc+t+bDAssFp4Nl/CqlG51jxdkWQkmYgTY42QYLsMugb8Ubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622662;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Iqr19so29sDkeozbJSQ1KgBllawgbShBmNPBODpX1HI=;
	b=X08AcTiftkVvzdtYkggqbGi/e4Oh5tNdF5fpI7TUc+jWFS9Q7Jv/EadYF2bLYUePfL5N
	 m9iOc+AKO8ihBdKWyyFXvYgJR6kywYfgXe9AOpucu3MwJ+vkjqQjqJiytQIZy1MwIj0o6
	 yDA+q6d7RYNHTW6J7FERx7+vnmgjwfz6tg4f/lOiBVpLekW0rjg+VVOT+erX/X1dBt24C
	 Gja2R3XTCA6MmmZN217cuU98c0qXhs9FrYKVsCnqWbMJtBhNSk3l+jpWINajGh2sihtXz
	 n0frCjhAwBkReekR+TLnypsfZJvaViWy/dtpj80X/6tbhYwK20U4B7W1O/dUxKoNbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaZ5ZhDm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC669606A32C
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaZ5ZhDm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344781F00A18;
	Mon,  2 Nov 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622661;
	bh=Iqr19so29sDkeozbJSQ1KgBllawgbShBmNPBODpX1HI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RaZ5ZhDmuCsgvozDvao4G1ybpIZ1EaOIMT78fRrHJls5rHbJdAUf5IX+RMOQPgdLh
	 nLNtKQFLfWAmK246JeHMMUnSGrSUAzSS+UV6guFzDS/x6jteQyxarbTp873HOEFO3w
	 LOPcIK7zhRNCLBGyos2PE46EkLJK9mKhTmHREzPCI+2jaYn6gCt/mV5heonejCB1rE
	 cPhGRkdZY8IAjkCqNGFXEG9XKr/dauI9Zgn0nxayrtmob/y3EePATLUGzJz9uTZQhy
	 Buw7EasNx8/CmpmYSSKhYyg1tA1dxLTnN/PAs6cteVNslxNxNXHl9mErBFOjR+7cDd
	 sGFGJCJIWBgHA==
Message-ID: <sashiko-outbox-193411@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: Use named initializers for acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk>
References: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 12:31:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-acpi-mfd-v=
1-1-d61029971be8@thegoodpenguin.co.uk?part=3D1

