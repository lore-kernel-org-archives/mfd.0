Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D438236F;
	Sat, 12 Sep 2026 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253707; cv=none; b=EQMOojpO6ake5iC46wIiEsGpF4foa0OeRvChEWD4bs0Zob25zbvIPK3PopWHa7X5ljqnIfrbc3E2TdB8H83Oc75ZKp9OOzW29oS7p9DT1ZPb3aUWGkMZ7X6+FHtFDZJzJoTRSj8plRI84+k7GXPh9pLwb4apQRHWHs+X6UKoezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253707; c=relaxed/simple;
	bh=AaEJ7LhdicvqPKMiwANG4BZts4uXIKXrYXUVoxD/uFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bUWGXn0Byk9UgPpC2xEq7HlBAZ4X8mF0mDXd7Pzw3q30mmq6DsG5KfAvpC6eyGd//l162ALqZhCjER4oEn5/lRhriDYWjU2lKvmYNCWr7JV7WAsgIYh33hD6Ngg/Je2hblWvmsJyFWHY7BaOWN2qub+PEpCnh2ycFTKVFTAIfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loLbjNza; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loLbjNza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E811F00893;
	Sat, 12 Sep 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253706;
	bh=AaEJ7LhdicvqPKMiwANG4BZts4uXIKXrYXUVoxD/uFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=loLbjNzaaHqidacsgT1EIUtqQZmg5OFPUsebCiY+Pnr2Rj69c05hk4GGVCKGkPdDy
	 Cd/lgP75Slb1VeHA36Yx94NoAh08DwZMCfcLWtTYjLH76mdUF5VnYriieEuyx7OgjW
	 1et6yO+zWf46EYjOevxTdmvycet9cLQfooc+vXJE5Mz6/bSywW7pwf8nJMH4hDx1Y8
	 S+8RhEIYwYJuvTwm6oyYeCZ/b5psio/NYuJsSdDX4Uw6GCXhCcCzfsL6T4whKoEGWm
	 IaMosMJDkpIK+kBQbUr5TIk0L6c/0TXw1PPitpE23/8p7vcbHRentR3hmhGV6ExB9B
	 4IrR8qCp4jGWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 3/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911225414.225980-4-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:05 +0000
Message-Id: <20260912225506.27E811F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D3

