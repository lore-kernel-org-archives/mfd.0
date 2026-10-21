Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585445;
	b=5IfRx13O9frDNz68HlJKn/C1hfFSpESWR2J3oJYhi6BH98BNJgU4Ismb6U9Y652XChKF
	 dmWbtIDWHsA2qsZmqhy6+7fvkEYQS9s7SXrhzvb0HX5/nWNxbjq94CgGidUttwo8/3JJs
	 Kxqawe3hL4HYtp/ptEv9d2T+RWTQzZ7+8ttFkAfFZwy9JWmleZzlO76wKQtvh/9StEZdo
	 hfNfCM3vqsz46czT6zNKMHW7JEj6q9T9l1YBCTSWJxs+Bv1k9H524Ob/cB5iZ5L+Z7onM
	 igpvoPhQoCtkABKOhpeENGqyAwHQ8XX1PX2bDBLpKmF9ERLkByzqDpiVgTQ87BZOsjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=U12Wu/eAmGH3N05M3Z1ULrXO34kH81G6N0J08lDliS8=;
	b=P4hON4fZ5C+MLyMD02MUZ94Lcdhdkk8xPiZ+msKOYR7x5QqA/0zL+6hM+wXqrC+6ovHA
	 SVg2I14A4Aty6pNB1vrckHO8pkCqzBmuMRkdkM045MqpsVR1kU6Ngak8fuMr3s7SvRCKi
	 LSYLrHnnv9y4wB90iqli62El5x8WtHixSvGsT/Yx69+AXT4nkKEB29J2x/HWCMid5R49n
	 51Q44aIo7v7jjI9lWGdHt3odPgEON/WEQCdctb2yzOzZ8UBGD+fP+WzhLvomyLTZSW+wi
	 aUjg9DnhG4sXXn4LaLlndq8wOq0gcBiyfrWr90WjNxeocYX1j76tmIBI1kPvb+6eanw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zt1stO5s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166D606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zt1stO5s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863061F000C4;
	Wed, 21 Oct 2026 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585444;
	bh=U12Wu/eAmGH3N05M3Z1ULrXO34kH81G6N0J08lDliS8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Zt1stO5srpik5PFhd0sw3MCLaKYV0h3YGueiEYEnIj2LdjU4/l6nMyXyYBp2DReES
	 8tL33A7l9zBZ3CMr+hJSj2P1VVZj+mTsxHkd8v62UcwhOPPHokj9VrwBfAfyAqoCkl
	 M1GuEesrdpp8dPAZz5AdQQQ5OBVNDw1bKCl4KHunNFsS9QuyP6AWO1RhHFEGBG+wNB
	 2XEl8z5O0j5yny5O/GBhBKvB7/dQ11N8vIjq26eEbYn9Jwb2Xqvp0ybijHeMFCp+UN
	 x0R+tZsYNm4HL3D+1okXoxHXV5iqDK2Rg2U33UokMFEuDE9tvfj/n9sURgWfkbhxS0
	 OkSZcBq3SLavA==
Message-ID: <sashiko-outbox-180243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/28] mfd: twl-core: Clear twl_priv pointer on teardown
 and probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-14-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-14-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:24:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> twl_probe() allocates the file-scope twl_priv state with devm_kzalloc()
> and checks for a non-NULL twl_priv at entry to reject multiple device
> instances.  However, twl_remove() and the early error paths in
> twl_probe() never reset twl_priv to NULL, a failure when adding MFD
> child devices bypasses twl_remove() by jumping to free instead of fail,
> and twl_remove() tears down the IRQ domain and dummy I2C clients before
> child devices are unregistered.  After devres frees the underlying
> memory on probe failure or unbind, twl_priv remains a dangling pointer,
> causing subsequent exported API calls to dereference freed memory and
> blocking future probe attempts with -EBUSY.
>=20
> Unregister DT-populated and MFD child devices at the start of
> twl_remove(), ensure mfd_add_devices() failures unwind via fail, and
> reset twl_priv to NULL in twl_remove() and on probe error exit.
>=20
> Fixes: 80a97ccd33be ("mfd: twl-core: Collect global variables behind one =
private structure (global)")
> Closes: https://sashiko.dev/#/bug/linux-73e82f84-94de-4d08-82a4-f22d42a1d=
edf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D14

