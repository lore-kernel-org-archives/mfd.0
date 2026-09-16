Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748DB4B8265
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576198; cv=none; b=jIzHbKa/ykKb3Vr21L6+lz6pBP+6flt/VOUqrqa6me4f1fXtoLGdpo9UpZslhcc6YqWQNGbsoQORTdJfEeu7/8ZxwMRTmlNT9k9NAh9Zvo/I2tr5qA01n9/ItlfSNfbbuVxETSaz9S08D7Q94jd1z4fmWWYqa0R3r0w8oBcIux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576198; c=relaxed/simple;
	bh=LDDvgVp3NvnHzUjnw4NfXOcJs/c2fkXYlmVRwXGLK9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sj9DZ8EHOUBNLjOd6Y0NwcDG8wsTQycmr5Bvz0rDSMQe85oOfnoikqnd0JffH6S/ts3aROEKAHNVGGwVUTw4Pkk4LKGVQtXXo3qXr/RtlCzikRBjlxoGsdayoLYMPPSB6NTogNhZqbSHVODDTYoCB5Xr3uRiJZuNtQk6tjZLaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcsGYWWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcsGYWWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD061F000FF;
	Wed, 16 Sep 2026 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576195;
	bh=LDDvgVp3NvnHzUjnw4NfXOcJs/c2fkXYlmVRwXGLK9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcsGYWWiC83vanS4qu1ghTVVmNTtajpeb6eyp5MMFj1Pk+ALKvDAdxpC4kNg+bXoc
	 x6VTZ1ebiiYk3GRRlsStFCtoM/Zt+uwbtieaNfSviqHp6o06B38sGEmIZxZj+BZpjd
	 7YjZhq6YpZpXlYcjchxlntDl95samhff9vi7euV2X/JoA/+mv8X8rACveHDPGUPYg9
	 nY2JPerE51aMG/yvEmAHg8tLuuZxMH9eEvRqLHMkccJ9Z6kykQ4AHYcBbzyMPJAXD3
	 I19I54g0Z5xh5FqJeJdhX8yaaW0mvs8oeMb5eGlQEubfg+aPV20Js9QXeTmP26Cbq+
	 p9j5KUJxWK2Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-intel-lpss-debugfs-v7-2-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
 <20260916-intel-lpss-debugfs-v7-2-eb51d41f55e0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:29:54 +0000
Message-Id: <20260916162955.1AD061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> S_IRUGO macro is obsoleted and not recommended to use,
> therefore replace it with plain octal values.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v7-0-eb51d41f55e0@gmail.com?part=3D2

