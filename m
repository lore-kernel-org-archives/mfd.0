Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42A11F419A;
	Tue,  1 Sep 2026 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295026; cv=none; b=HOej62/lAF/hgmIX8VaGxw0arskATGiM/rTnNLFVWMo0PsN34Fb/OBmqlfHrcpLcC30ZyvQjw+jV/bm1gptGi8Jz/AByuDK991qSYexJrCftfqO9s5uNWvyKYsKld0NKBoo/S1K3TFY5pCgTnuQFe+ehNwtLu1S1YnAG5Mv9ntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295026; c=relaxed/simple;
	bh=IYK01bOB+WkSQB75HnlMv5MXWjEfwBhUhWWrXlN2l6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IunbZjNOm5uWS/YdHJRSJjfzqcpUToyK3Su66qBDkvTZvmI3F3TA6yPve0dLyYTxzLt3AF+HBNMfyBpnyLvB8S/NbIU3PwDzNMpggzizWydTtrHUBV/64KScDOpu0uxCv4CQuG4WrXk7uZEv8bBcsniWOtUGJM0GymuW7wMyZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmr7sjAs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmr7sjAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D331F000E9;
	Tue,  1 Sep 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295025;
	bh=IYK01bOB+WkSQB75HnlMv5MXWjEfwBhUhWWrXlN2l6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmr7sjAsxgro8hN2zX02IdYicGjlwoV6GBkKXtzIa4fBc8/zi5SjPOCLp3+OWtHUo
	 x04DOuVnUXwuuZNA4ZcMQYMjo1qOil1HhAFdrgjxxLRJjtvCCsykJeyM9a3ujIC+NX
	 s6wVGO3ExLf5ML0DKtNwPUsAySeygKl24oi1pkRE5gJitM3DEZOJR8uvd4V27eHHnE
	 1/Gug+nxcrBeE7C5CGS9CoNcQHlpNlK7rFkLS/9mfmVvWCKEjYAaBf0VXf1uzjmc64
	 8q6T9q9MtiSG5E98PER41q/yTf/EPwO2OYmP5TOyR9YlwF9qXLzFtP3y3WR+Sdfh9S
	 GhZ+PtPJDxirA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/13] regulator: ab8500: Use scoped guard for shared
 mode mutex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-11-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-11-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:37:04 +0000
Message-Id: <20260901203704.C1D331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use a scoped mutex guard in ab8500_regulator_set_mode().
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D11

