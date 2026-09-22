Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3348F85C;
	Tue, 22 Sep 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074221; cv=none; b=dVuTfYF+8bGXnx6ESoggOw1nbKLnQVn4htrC2W6x3sTAMtj+BrvOc1oQO81D0cxEbBu4+q/K2KmSueI0YCt950cHW87KNMRvVR5hkFZ48oe7I/tInmh6+MJ+u/hXB1lwG3PqjdQvxxS3oiVEN7NlEtF85sbJhq27ZK2jP4MvkTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074221; c=relaxed/simple;
	bh=PpkvljtiJh9ifAVwomC1pnrEIIPySBoDAR8ZhT9ufMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NoOLm0ynKoH9AilfoQ563Jm3T8U3j6CGXcZvqwPTrfomFGNNL72DUMoJnh0hjruotw1r8J9NDvK4NMdjVEmhRsHLZ9QjqqfVS/sJMF195siZNiYX+6Sqt9zAhvVnSuX7CnbAPEmxvqS5d7BfpgzxyNEpwqnVol1dgz60VcKJeFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYITFY11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYITFY11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685311F000FF;
	Tue, 22 Sep 2026 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074219;
	bh=D7joL9jnBPIgpSCdigDprJQYjlUtilYbRowEWg3+3u0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYITFY1100Pe9vg0QKxTIINdYmmQblmKWbmDSg4NXd4pQsmEj3YdOBa0knyjy/pXJ
	 3MqJOIPs4nphaG8lZPNrITJ5JyghZAABJ7pN1DVBe9Il+T0k7jAQ1cXI1CTGP9TihG
	 5IuE4X6W5E8VoKOY9XzEB/ZDtz43Y/MMGxBA9xJeYY8CPMNEcstf7jTfCmT7zm+1EX
	 HIJAJnbCg0/E3Dhq54W2Z+UBImsGS54Y69Pe2XRT+4UIujS0rD9k4DbALVyI7xayFN
	 gOt+SLkZm1wVcjyQIf+4eHMVsX1qdISkCNIcXU4olUbLXATOkU1aHE9or+3BAa0Gzi
	 eUXQWzxBflYpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260922103551.2754613-5-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:50:19 +0000
Message-Id: <20260922105019.685311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: driver-specific header incorrectly placed in global include/li=
nux/mfd/
--

commit ee0020c355157050632a39b51c33798536ac333a
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

    mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport I=
3C
hub devices. The devices connect to a host via I3C/I2C/SMBus and expose
multiple downstream target ports.

> diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> new file mode 100644
> index 0000000000000..eb4792de5440e
> --- /dev/null
> +++ b/include/linux/mfd/p3h2840.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025-2026 NXP
> + */
> +
> +#ifndef _LINUX_MFD_P3H2840_H
> +#define _LINUX_MFD_P3H2840_H

[Severity: Low]
Could this newly introduced driver-specific header be moved to the local
drivers/mfd/ directory instead of being placed in the global
include/linux/mfd/ space?

The MFD subsystem guidelines specify that driver-specific headers containing
private structures like struct p3h2x4x should not be placed in the global
include/linux/mfd/ directory if they are only used by the parent and its
immediate children.

Placing it here causes a layering violation and introduces tight coupling by
polluting the global include space at compile time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D4
