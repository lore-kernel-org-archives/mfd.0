Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90899429CE9
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273950; cv=none; b=NCwZa8ZOd0o3yq00uZI5MVm92rSfkVX1asB5kHYN0R5rkip6WzgfdMte69+ajNX8J8poB+jLhHvCS+EBq7lpdlpQGQ75bRst/unLJBLtFIQ6RRM+fGIQaibU1k8HIwysEcWf9hv7VLgkR+lQ0x4CwRXykNYlCqD8nHjIOI1LDRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273950; c=relaxed/simple;
	bh=APWk0uOj8/6LVjgqEtJk1b6uSGlDci9M7cPzBIGfdF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c18S4rNYd28qPdgtiArhq9YZnU5adIA/PIS9FPlhr8ND+1uoaL7JTERa11UINzlMqX8/BAPphgV+rGICqnHKYmwHYYW5MSQEj3SZnxBpX11joIt7JegwiYjz9/HZH+wYxhlG/lSbY0etv670VIseepyTfjvXbOHTer28B9tnvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvfXxU1E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvfXxU1E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954df200ddso1698205e9.0
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273947; x=1785878747; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=gvfXxU1Er6PKQAjG0W3stCi8+Jc7q3PikkDwT+AqZ1ZudMfmxSetUfoj2I3BHcxa8b
         pWNaLiTCD6xpx2SPWElbL3CjZdj+/48fCCUKl0ATTSFwk3tSVBBb51oyKT2uzChoybny
         auEM51MrQSOYP+rPLVrh2j7kHxNpFBWW+WIoWW7J0J8Wy9tA0s0apBenEhpoLfm8pphM
         VlDF7mW/rhPhRQWUf1Z2BoEzrJZIiU9aj35iV0q/9/XoPocIR+t0zm8HW9cIwMoCSbXY
         JgPZ8WcscyXTjKbEkh5y71nxjHWoNfl5DrgCZhx60fclBF30LPwI/3VC9AO0PNDoLrJm
         7ZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273947; x=1785878747;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1dUKZYq5xkF+c+j8L2UCzb9nPYl48cxNMgRgY7fYgmE=;
        b=FuXPprNw0MIRymSf1QayZ8yTIQ1QITqozYLeEz0d8YbTnRJe2R+veZ9So7O+B9RDg5
         NZWzr72FT8hdCG4H+/oiIHHpcESF9Pw6FCzopwXEal3+9geWS3NB9kh2KXc4UkrkzTvw
         7hiMD3L1IkReqpvJRXmH6dFdw7Msmes0agJaDSDnys62TEjH/vIDmfGXq8NrjSFlHyWC
         9DX93s2Rxsdv+M27Fmc+z831E8SAVTqdf7UEWgmSF1oCws+tWpj5EoC0AzAB4PyshIOZ
         rbg5njclDrB7yAB3tKFJWEzjGEZheBiOFbWp0w+93TNnsDd9XtPx+bhZ0cyh449Vf9ru
         eWFw==
X-Forwarded-Encrypted: i=1; AHgh+RqowQdFTpki4Kwgyf3LTs9vxRbwusqU5Nv40Ypx4Iy1tr1b3ZWNqQJvKsoqVeaUpD8QxpA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/M9GhoiZYwclgB9HSj5UO0pdKSSHRiQlTexOFKQBmHK3JnLVK
	n7k4l49eAs70Q0HwvD2wb4gpSzq85s5nkVxuseawv3RcwYK9tYt3oT6U
X-Gm-Gg: AR+sD134OOomQASAVJrKMMa+pUmygTCKAnbBJMSx2ZI44fbHYdm1egYJfgoIparGhGi
	cHZh+l2Wo6ly99JQ4ZeZIc2RSH8G1s5fJQm6fjaf5gflCK93fXf4wgiOsNy+xy11UZ0XTfuE+Gh
	ZbSh8KRqMpJSFu8HFjKxcQlsgMhYn7t5IrO6NTj9zHwtz+/XXTfsEBttkAC5TT55wG4/9E0BWtv
	/GZGLwSxzZSo0QZo199O15y3rEiHD/uRTN5lX33MN8CxENb5Xzg3ZQHeJu6Y8m2RC1KyYnPH9VR
	5YViOZnj73y/C2hIvqjI2XfERMdnNJJLEzptN0Ggn75Pf4sPYRaUNVDoU3K5LjBI0I1iTyFe4uA
	sznKmOttRqGqHSJoDFmY6t6yTyJPkaSyWR/5ZuWSDoj2nvpavwfAskrvk76NsxKKyhV/hzgRkzV
	OsPKUnT6tcDWKcxnx/cuVTpzADtkM6z99THF63+BwGa3hibWQekoRRCudRhQaofA4J/egpze8=
X-Received: by 2002:a05:600d:844e:20b0:495:5375:2510 with SMTP id 5b1f17b1804b1-496c6568a37mr33118015e9.24.1785273946598;
        Tue, 28 Jul 2026 14:25:46 -0700 (PDT)
Received: from grey.localnet ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm103054375e9.7.2026.07.28.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:25:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com> <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartYxrm5NhARqO7C27MMFWz9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Date: Wed, 29 Jul 2026 00:25:34 +0300
Message-ID: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
In-Reply-To: <ami0TaY84IslWZyo@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks for the review!

Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> Looking into the other patches. There's more mixing of the clk provider
> calling the clk consumer APIs here. It looks like this just takes a
> reference and holds them. Would moving to parent_data address this?

I think so. parent_data::fw_name is indeed something I have been looking for 
and didn't stumble across myself. And I suspect when you say "use 
parent_data", you don't mean "use parent_data.name everywhere".

But it raises the question of how to handle internal clocks, e.g. foo_gate-
>foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
found via fw_name, and only foo_gate is exported.

For the other clocks I currently rely on the string matching to resolve the 
parent named in the static init data to an actual registered clk_hw. The 
alternative I see is storing the struct clk_hw * in a table by index and pass 
it in parent_data.hw, but that'd require managing the extra indices. Or build 
a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
matching.

Am I missing something obvious? Is there a canonical implementation somewhere 
that implements modern best practices? I learned that looking at existing 
drivers isn't always a reliable guide.

Cheers,
Stefan
--nextPartYxrm5NhARqO7C27MMFWz9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmppHk4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoirHYQAJP3CdwusoH3pkXKfPo4
IsHXR5HpSkcfs8UCWKbXUiLjzTOXi23M6YRSjmwFG3d1x7/tF3zuRiRB7UoTbPxi
Dpcjy4P38mBhhj5ViTMPZEDb1+yGlH/55A3Q13yyGUZAYrWBvjlF1+CeyejwGj3i
MVs7cQGfnjS5eKxnSlMeu6YES3/GMT1FEr87RSiK1tIR7l5Ly+ZlVUeFL6j/QR5c
0fRWrLVaRuf40Z+Br0mTqVYameqPi3Y2txNe/WB5/6G3h+Pwgr8fa18n7kss1CR4
PLy4xOCkdwBhFr3V1XAwmLR903mrts0OzyiU2WEgelU4aIvO0g+IY/QpVCb4Tc28
sIFnx1o9RB82nrHOGyZ+tE3Td9Z8jdagf7NCcynDF9OBNO8d2p2VHrytuTO05BU0
6WTcRZf3HNTRavdGicG0D+UZLTrVSeATG7Gn84xOtEcqnNQgqGw+7FFrbYL3uvnB
zJpQ0g3TxhaSjw9l5WYghaypuxgBUI3vsXsNBCFUi9/LHutvv7c2UFoB9pGMO+0F
agh+s3+qnrEIuyCa6gMNO0ARQMjjfVWPCMn+QO0W6LDHLm9V862PI8/fSAHIJtBw
8YniFVm03EcJNgSelHRlZO20sDNBbjjcJdMzKez23UwFsD+debYrdpQOo4Z1MVqr
o4X7ofieFY9lg1CnhuLk+OK+
=e+iT
-----END PGP SIGNATURE-----

--nextPartYxrm5NhARqO7C27MMFWz9g--



