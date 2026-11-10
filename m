Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348006;
	b=0dfADSeh+QSGpgxAj80+CXbmj+34GKIB7D/04ewyS95ZDhXiufBpwO4lKsuRZV7h/III
	 0O35WuVkWFQ3QrRfEvEJTabbScUSNTNVY7N2Vj07/xfLlH/ImDfXc5uHk0SiCaP4Vfj3Z
	 6LuhEiXNhDYzH7gYagUhWqHEzWGflQG1z1u6Dc/94UNae7g6yceaIQlMTjSH6TGYq7EW/
	 P5s14DaccKamFW/+0vQo+9I/ZlJeAaSTwqFRyjWrB+wi+Zkd9+B3O81P8NjrpurP/5mw1
	 uzfop5jUJylZ43PeLpiRAS2OPe1kkwqMvHlxHq/XqRArwaZICo97y8Y52z7AMRMQ9Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348006;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+CGfvXx3N6cVZrPdzaoRF/cAljWHLy0RvYNsJD3Tj8A=;
	b=5Uwh89aG517NieEFQqwuZghcOyCsvkiUSCqwOs112XAm0qNQAhvCfNn9oxzovo/fCfEL
	 F4lfe3QxbICAvyxKMIdYWnitjHwcqghnDbz/I8tS6a8epEmxsn29O3UuDnxKN+oH1Q1dN
	 g/7RFKzuCY3mlMO+F7r4uN4rpV/45iL6sIhtgm/rfIzrmceFqvb2ZGt2C50BkSWC6OqDp
	 +SXYlKOzCyuRv+0j85Vsv+577g9KDFci7cLbxoA6QVRzjFU8deEfZJU4bJXNyzbQYoSEX
	 6qeIGwBHI7+k03kC3BBMSSkJ4kzNngA+pGRPYtOlRLt4nRKIZ7lgcl4lv7s650RMCiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DumoIZ3h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04833606A334
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DumoIZ3h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559181F008A2;
	Tue, 10 Nov 2026 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348005;
	bh=+CGfvXx3N6cVZrPdzaoRF/cAljWHLy0RvYNsJD3Tj8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DumoIZ3hUHu9zIzplXabcMcOZgv9ymETDz+IZOEMoSdDl7BHHoU1BquXvaGZ/gXaN
	 EyGPGKahXkh7duT0rODI0rh/R6n66PXaaZMinADnOFGQcY1NGT75wN7C4/1gN+UEpO
	 0KQfq+DanvABAWALe7a+eoZa7rYgbxkR5eThetQTTIHBgyuYfu6hjoKRTDet2RgaSN
	 T8TU/w8JEUKH+q9JpPWGFWmIsOr9m3Rgm3XXSnhvjNXW4KVneCm8hVnQbx0MiB2Opm
	 XVv3Z/Fcsp/HykYV6Q3siM8hmGh13CZWhpt+kHtSAZ0f22y/AbasRyzPJrKGl74qW+
	 IxtDQ8qms8UOg==
Message-ID: <sashiko-outbox-207797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 17/20] mfd: Unify style of dmi_system_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <d5b5b1bc744791e3d3c0853c49cb929d7859f6a1.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <d5b5b1bc744791e3d3c0853c49cb929d7859f6a1.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:00:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Only the list terminators didn't match this style as they didn't use a
> space.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D17

