Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419D1A2C04
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569890; cv=none; b=FS9DZOj/0ACSvCQzmN36UtGwAaDRpnYkrTKgw+taUTzWv3mP5aPBmAxxwnQT9WS1LoXw8dxyARwFfUAbpYlH7SXaiRozJ/aMDd8Q5f43JVxMWSjbUEnemW5ViSEUaHnOcCupHWDseKIWTo1X3MucVencBnt6B4UcMr4bXHrwwAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569890; c=relaxed/simple;
	bh=YjQLDxRmEfhAnUHkS8iNE5LOH5TLn4y8Fr6fxakhyOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EBUJOpqntjZebBv7A/SZeZZxgpFzvJti+5D61n3t50+Gbskjre3Np2rNyfFnZftRd2QLjP63FT5s/ypBP/0DGDEyahrpWQFVUuTtBgB9dxIxYp2TkT4UOPIVVCCiG/Efmo9M+zQMitlZv4ai3Z31dscCwWwazgLWrwSwBB7h3Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXQdHDJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXQdHDJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9186D1F000FF;
	Wed, 16 Sep 2026 14:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569888;
	bh=YjQLDxRmEfhAnUHkS8iNE5LOH5TLn4y8Fr6fxakhyOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXQdHDJWT55dzHb01rP4ZwUE3bQYLWEPhF1t90LN/DeAPR9xdO7GLEkLKO3jVcXf9
	 GHUlrgTHXh/Ej/YscB8ZRmof/PXgPsT8rfPkkd1E4V2C3iFUtqUc7ULa4mNsckfoDa
	 Z/vJ10F+Cose7wP/+t43I6X78QjCTkIcrdFjPQdXixJvXQpLMh5E8x/2E0xTHipS6V
	 XmV3Hwg6zvYEPXVh9k43hpDOn5ujYbJ6m+tuYUr5+tCKiMEmQ7b6+fFiJO9Pf0qRcY
	 hOUSbbILppwOkWWalrlbWXbGuzxhcrzB9Q33ppUj9Qt3czLumfuf+A6w3MOPidWuYh
	 iE5H/FcdhxD+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:44:48 +0000
Message-Id: <20260916144448.9186D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> There is no point to keep the variable dir just to assing
> lpss->debugfs to it later, just use lpss->debugfs directly.
>=20
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-intel-lpss=
-debugfs-v6-0-5c118ac430ed@gmail.com?part=3D3

