Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085443A2E25;
	Wed, 23 Sep 2026 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152647; cv=none; b=ng1QQrpz1dv+w5sLuRAI9SMoLTqXdQjaAHXGSEtKS5Kc8d84ZL36k84ao3bDZOWSUcXvzUqI/DtMEZTaQKkBDACTwIcW0QmNrHkoxUaQ+HH68NkIWxS9NhhKlXjaZiTmz0sfoinD+WCL2Uo/PMFnLvguGG2N9GUwWHPcALpzzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152647; c=relaxed/simple;
	bh=dPWw7GE8uswX9K8H2M419DIu5LNrQ1i8KSy7Ie+DVZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSVNkPRKYd6vqIFRqS7vYeivvsPSQx+Y2Zcg1hLb8LYlsj9PfqP1RqtndOwhOSzFayNQq8l5CNfe+zadR9LF06pgSad9Ue2pvOyiSkgJsym8vdPaDJw6MkL49pmiHfc/NFeUIGDk0n8nHI/FdiaTA6C9K3zC5LDsNdKutxfRRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFYpe0Ha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFYpe0Ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560B41F000FF;
	Wed, 23 Sep 2026 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152630;
	bh=RbOPVQZijf0JUWESbii9hlDYUJwIPjtKd6TL/JI0vh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFYpe0HaUIbGWq/fV48rX0Kv+kt9M6gE4h3fc6z8qxmnzw9LxPQXmRHHVvvrQEpCv
	 Hsftsjv6ijeI6DvSifL4fZK8FGFceUtHFr/F9FBJJd+Q8G0oIudOzit1fGA8vf/dk+
	 hU/lySh2eV3mJ4jhsIqvinweGMG9MJ2p5mLllRw65sWsMFE14pWOua672J5FeRCgcj
	 AGqlOqGa1eiQcqf2nTh73tjCQRKZdWf93ZFLyRiBdOPxjGrp3qEKsMfjyfz/a83p00
	 zIouDHTfY4hJPvRkYZodjkIo17ERbtOiRILa+sRKr4KbHM69gqwB+yZo+Ig478fcve
	 AHh+my+eE9wSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260923083001.606935-1-quchaosheng000406@163.com>
References: <20260923083001.606935-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:37:09 +0000
Message-Id: <20260923083710.560B41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> pinctrl-rk805.txt describes the pinmux controller that is part of the
> Rockchip RK805 PMIC. The PMIC itself is already described by
> rockchip,rk805.yaml, so the pinmux part belongs there as well: the
> pinctrl node is a child of the PMIC node, not a separate device.
>=20
> Fold the pinmux description into rockchip,rk805.yaml and drop the
> standalone text binding.
>=20
> While doing so, add the missing child node schema. The rockchip,rk805.yaml
> schema ends with 'additionalProperties: false' but did not describe the p=
in
> configuration child nodes at all, so a valid pinmux node like the one sho=
wn
> in pinctrl-rk805.txt was rejected:
>=20
>     pmic@18 (rockchip,rk805): 'rk805-default-pins' does not match any of
>     the regexes: '^pinctrl-[0-9]+$'
> [ ... ]
> Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng0=
00406@163.com?part=3D1
> Link: https://sashiko.dev/#/patchset/20260923062746.516666-1-quchaosheng0=
00406@163.com?part=3D1
> Link: https://sashiko.dev/#/patchset/20260923074337.575122-1-quchaosheng0=
00406@163.com?part=3D1
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923083001.6069=
35-1-quchaosheng000406@163.com?part=3D1

