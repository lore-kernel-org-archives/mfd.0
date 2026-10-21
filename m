Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585403;
	b=2sPDoQmShl7o1q+aM1Q8hSElLK8V6sMclxF+SCvVm2flNBta7byh/cCO++aM2swJST0A
	 yfy7cKkIvqwCmbJmihZAtFbmTVwfEIKH68TM3xSpGz9bR1PMmav7whrz0JvdagTkW/Kkn
	 s09p1Y1MfQ7cr6glG7LYL5a+bK5ePqNO409f8F1jq+dKFRneg3vxD7SIymmu9bZ8YpgU7
	 HJ3e4dvSxtU09d9oE5WTEK+6ESZutKaDvSFK00l89m5mQIQuUBCdyJp5cFd+S8xDpqZuE
	 3M6g4YClxIOraDwVX6LQ9GmgZSfjvJQx6SIaQlfDxXSmFy2FnjXoqB/c5rtDKQcTezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R9By56OabAq+WOCwmRAgCLT+AwcWarSekgAsfGqrjyg=;
	b=JJdgPs5a4ORGa5AjKGzVg3BFu7/4mhcCIHZK4WsqDB6xkfOAwxyiWGeTmjafklXZOTYF
	 V5zLEDaPdhoU9+les3rvkDJjUui7wREb5fwBnp0l9gXhkJ5oM5gjKLsrnJsGCoLKmjC//
	 AjXeSbtDxJIshyVvlYWIvDuNJkw8gEpbhOX1WuFJCINVvRSxu9eDyhhUql1yWvZNeiPLE
	 PMVuM+ciSpooRZBrCO0vf0P74abPCFkL8Ptys1c+lntdyXyWsSWguu7glbM0eX+Yu8Ce7
	 +1BtUTK/2fqI5QklfjDIrwCl3X+0nSfqJ9Q+nrK4Y7tdFrUF7YrLmHTK4kRS/ZO2/nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1pwzPhz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543CC606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1pwzPhz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0161B1F000C5;
	Wed, 21 Oct 2026 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585403;
	bh=R9By56OabAq+WOCwmRAgCLT+AwcWarSekgAsfGqrjyg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=g1pwzPhzo6y4L7Ly/kgpu70nuQZhbGodEETlyTRzc+ZtnhXuorreJ+nD5NUJobf/l
	 lY4GudDVniIy+ja/NCjp5g+dY79dUlMrIFqLjfTElymGe+CVWSJi0pJnZNff6NhZA/
	 hb7B0IIi/V3nJfqmYzkBSH9XQsSSrDI7Pe+1rVmDFxBDlFX4WZoYE2ZZ6ao5Dz82XR
	 CRCUyxpvwm5g+Vpg7zDOxvhvquvyaFuYlV9opXocM+lxX6QHcLr4QLIUj06rY+0/WC
	 dHta/J+YyAWRwRkOjm/Q2l16MzvZsmNEEJ4ToAAahirBbjKdIMMDdNm+dJvuqM9YY1
	 lKHlD9nxzJnTA==
Message-ID: <sashiko-outbox-180241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/28] mfd: ti_am335x_tscadc: Remove redundant
 ti_tscadc_dev_get() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-28-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-28-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:23:22 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Now that ti_tscadc_dev_get() is a single-line wrapper around
> dev_get_drvdata(p->dev.parent), remove the bespoke helper and retrieve
> the parent driver data directly in the child ADC and touchscreen
> drivers.
>=20
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D28

