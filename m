Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796295;
	b=gNlXD2F22mwf6jWqtIIsp4HhmabxQVyDm9E71H9scCp6+jpuMoWoUqv43D2cWMvOn1k1
	 UrTiK41LX10rvQGf60TBXZL5BoBJYchNyecoImVidW0+Ez7XjJGr+4fdDb18FhZTk8OAi
	 f9FJ2O/0j2t6iovFNyraKKaOVmBLQ0HGVc5RaXMv3MN2ZMSJruYyrjn+Ch9ReXrDfQiiO
	 zZqnU9X3ciZZ9Eh8kpG+xf1zRzqwv9I/K8DNbL/SuqF8GdSasUPaEMKiSZhj91pUYXqhv
	 skHjcvgkrDhqmLpCSVIFt88KZMwnJLvdKzQW81shDgZrlwNcZttgyxoOMzlSSaKmcQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796295;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P6imYAobOfw+gVY0k5Dcu6FS1chu3dGpyy7sALGPyMM=;
	b=gGNj3jvVXjiRPDoR5V577CKV/988ZtNtZq2PpE41c874exthYZ6O0APCm8HBc27aeyBO
	 eg7HvD4efKUkV+5IkFtOS6hB77Bz43eyDvlCcAGavQa0kGbwTLhOZHFuBUZPhfaw9bXvl
	 IAgPvi2J4j3NNmUJzO60zQhlGzRNz63n8YwvgYWW831EMFet6Qie9uJqeEQ97U7a6UR03
	 2N7KdnhzBMn3h6T8QvZ14oLARS0RETxM6+umnkXt/UB48YJPC4pq72IrV8qECEF7Mu/rP
	 Ahw8wDnGjYG002DK61oSyrme7Qfrupo0sBquZsBN7rW/9uHc0BjQHPJDbLcm+kBD/5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APGRfClf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09111606A336;
	Wed,  4 Nov 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APGRfClf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782A61F00A1C;
	Wed,  4 Nov 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796294;
	bh=P6imYAobOfw+gVY0k5Dcu6FS1chu3dGpyy7sALGPyMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APGRfClfYavS65wPnJE2DoQVYSyg/Ca74b8gNGBH6R0uueyItkdtfhRaUq5baaLmv
	 kAR1q0Ax1I4LW4WGzOFjiq1zReEbZJSyZr7fYOMuKrLoGCU3156k08N250vOKQt66G
	 gW2/gvEhXx50jpH4JTBU3zovi53ZwQ3MMFbkQmtHKZW/dcilKEPaERIO1Z2xvD4Gim
	 wvWQj7psJ/v0KpGS22TmvzANwnsgZIwsl0t1kHy2ZvZfhX9t+igzKiWzAG1QfGoKDb
	 DY6re5KCgFhttahROUDJ71CCC3jnT84a2IwMKu1HqKjNjTG74jQBCrrNJz7URrTyri
	 wHp7QHo/wwEiA==
Message-ID: <sashiko-outbox-197292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] backlight: aat2870: Derive brightness steps from
 max current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104123714.234634-3-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
 <20261104123714.234634-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:44:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104123714.2346=
34-1-clamor95@gmail.com?part=3D2

