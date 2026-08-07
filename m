Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B394B04BF;
	Fri,  7 Aug 2026 01:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065950; cv=none; b=skH0TDdNc/lBOM7mi04cEeGsPpgT8LzLG3dCokimFYcVmIcrggYwMpAyE+dn0tF9tzIr+p883wu5Hv/8j/4Wa8KHdNO6AVtBTdqxGdCff6XF9jot/kase6kJDXKbMKES691YXc0nZDrJQ8JFDtdKYCLnpcuTDnMqRI5Jq+MCzZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065950; c=relaxed/simple;
	bh=2kIKcmiEerdy0E5dlWHijdJoKCjYoDitZkBM7KZc2Xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l0u2auYG4SI+jv5DzpgW2cFo/MZ90R0GznX1AbO+aBXNWPZ93YdIKzthS0KP7e8ZETvQAqsdWpJplSrpfABx4hHoea0RFzUc61xRG/zwivbLzpFwQmVUcsrvauLtx72L2nIsP+wYbK6rEwidSPzorEalSW34gkGcyvE5EuERXFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGjQK6E3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGjQK6E3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9CA1F000E9;
	Fri,  7 Aug 2026 01:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786065949;
	bh=2kIKcmiEerdy0E5dlWHijdJoKCjYoDitZkBM7KZc2Xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mGjQK6E3wz8gebuYZcIhYVnD4rbyXB9o+3wj3CKxxO5Ai/IvXe47SzQD8PbSO37G+
	 oDDP9IopDd1RA5WdHLGyPlKw6Xs1YsN/8OuUqa1nWyNkF5ig9q1E5caOJM4wXIuoD6
	 Xqy7xtbmQFz1KxKu6HUgWp+eg/NI702chu/A2AYueIny81Gmn8xRX+QOrroeCjua32
	 ZedTih/7wUUTtmYnlrTTZke8mnoEyxpG05SzV0LHoxvZta0hAjJ06G4jj57HBhLUE5
	 AIzfjCviRO8LBnekUdDa44HyovtNMD9e7dd6aRAy2xq8HkJhd7Dvktmn7311EiRgZG
	 NAUDIRAuuTFjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: mfd: x-powers: add AC200
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-1-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
 <20260805-submit-acx00-of-dynamic-v1-v3-1-32c3210a6f25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 01:24:48 +0000
Message-Id: <20260807012549.0B9CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating strict=
 MFD subsystem guidelines.
--

--- Patch [1]: [PATCH net-next v3 1/4] dt-bindings: mfd: x-powers: add AC20=
0 ---
commit 03a0e69c8a2c3321e06aceddf905ac04dfd2a7a0
Author: James Hilliard <james.hilliard1@gmail.com>

dt-bindings: mfd: x-powers: add AC200

This commit adds device tree binding documentation for the X-Powers AC200
mixed-signal companion IC. It details the required properties for the parent
device, including power supplies and input clocks.

> dt-bindings: mfd: x-powers: add AC200

[Severity: Low]
This isn't a bug, but the description after the subsystem prefix isn't
capitalized. The MFD subsystem guidelines request that the description
always be capitalized. Could this be updated to "Add AC200"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-submit-acx=
00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com?part=3D1
