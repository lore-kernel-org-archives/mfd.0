Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3C63F9F47;
	Tue,  4 Aug 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858692; cv=none; b=DSdHle8eVSIM8nBVvAeRMJvacR88bTw7vkVLTfz6lTTUn+PI6s8cCnQ8BnOg4nbDGQ+qYz6pbL6+4UI9xaILOkdGlTKUo5qqRWQ6PNfAeiQ5KD+OTf/YzJ+qAJxi0SZ2BercitfUI1RLBq1T9/HBjRX9mcrlSDXKEp3r0POEwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858692; c=relaxed/simple;
	bh=hiv0cD2IwEzrXLdpIZawutXXxobFxUemz0vtSXicNJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VWrpOz55vXRsear+YiBFbHK7KWCgKs2x3FEyv7KGXIcOz7R7PKAJMVTJQGq8a4vhF18mwKyNq0k49S+Gh0IT1aP5gk2/1Qxc1OmUoXZi4o11jKnlY/rfvyTGVHaWY9d1C/K8C2xn9HOUc+A2YFw4VFML/kYAug8H+qIYuPnnRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1uSPNHd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1uSPNHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4214D1F000E9;
	Tue,  4 Aug 2026 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785858690;
	bh=hiv0cD2IwEzrXLdpIZawutXXxobFxUemz0vtSXicNJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1uSPNHdwLkE0Oh79QkM1CrH7pNf3vDmL6PWNNWYrq+Gc0FMIzqvsx00Yea+HwPH0
	 EPbNw9wbIiXQzXOoroQUhLIsfkHgSQ2yILabxI27jlXT/FGmg/A9mX3C86E+90ay9z
	 OX9JLLHMk7J5SqC+7eioSoP/vsfy6f4ojfENVo7nap4erNvN/wL9dJsj91zG31XdiJ
	 3TOCadMc6Uer7YoEE4R2aFm2PR7W/3s+loNfxea0891xU2JhldePdFquNy57w9dCNa
	 OLd9UbXYLLjyIRcKB5vgkoSWUl0gNmETQWEpA5DQLIktocoL3WNIcRa3SZNPoN28sq
	 A1SqxNvQXa7KQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: mfd: ti,twl: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-mfd-syspower-v1-6-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-6-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:51:29 +0000
Message-Id: <20260804155130.4214D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Switch the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D6

