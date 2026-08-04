Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492153CB8FD;
	Tue,  4 Aug 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860052; cv=none; b=A0cEoNFBaGl5LghQe0c5UDVqBzj/Do+K12iTrQ0EcN1dau2jNC7AKaEXNqMxo5ZRQitvzTuchklk3Eqm65YYYp+sv2IjOBI2OQ+lCVgUDvczNUFw+iOOg8gD9WXt0eWECuCciznc4PG9R8XUuhEANnn7pbVBCY9yujKmRsY4B1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860052; c=relaxed/simple;
	bh=sgM+GQbhwf2w8A6W5191cIB2L2EejmYwIGJ229R/HZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dJ+CpVQtRLtMZFoxkRxa/DHsaaLAjEOP4yR8j66Wxzfp9Ud0ipAWW1Uyv8/biurbG4TRAc3EI+Vv69bXCaESLN2YeygepcDRura5Gn8XeAJcGeXddXTYgKtd4Cz+2LdapAF4qO1y7/XhkssUo02nVk5BCuT+XoPH5TTQqaZwnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNuwqLsF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNuwqLsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842BE1F000E9;
	Tue,  4 Aug 2026 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860050;
	bh=sgM+GQbhwf2w8A6W5191cIB2L2EejmYwIGJ229R/HZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PNuwqLsFKmtbLykdWa7uho58YtvSIhnOIWFdMRhp0H/ow11jzgqAygBK1RftndIXv
	 HNdOrBlxybi6xusty2henDhbfG4lYfbNS8auex578iQh/Zq9VVsMoAmxqBcyiRloiw
	 TB0QdQCSpjiZZxfCtD0IoCm/aisRD8v7L9jev7SPLP8t4qAXub3h8ECa8XWwvIEBeo
	 OojkeNONfOUfymEl0+kJ0YFbLJ5uhtSfEqLAewV9tYG+waMHqQ0KTELB4l84sO+Cep
	 B/lDUjhoZpwbpVv9KFN0f1vMSEVZSLGY19erhbe7YVpYDpueU2IdV2swCs3q0oipEB
	 oNLnAZB3r/XQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] dt-bindings: mfd: samsung,s2mpg10-pmic: Use
 generic power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-10-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-10-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:14:10 +0000
Message-Id: <20260804161410.842BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Switch the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D10

