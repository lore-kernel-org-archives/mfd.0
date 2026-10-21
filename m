Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565342;
	b=AvygW0FMhK/vXVaIaX2nWG9uWH7ZW1Ylp4Hca7ao20g9pKbQ8e1pryA8mHbqbO89NlND
	 cYf5h9id36yGEd992zXvXSxU2s8kw9RKCVbjyQY5XVJVnQy1VGJQNwhPu4zqcXyvmXUMY
	 a5fpA8gF038xdgoVkeCJN8kAcFv/X30OWq7LI9RLw/ER0k/riFTBfVUYbtD7fyNkmP1K0
	 lMV+gKlo3t33Xlz+sMCC7Nse1qSwFxtEX5zIDMP0UgN86b5CuO2VOHB5IlgO4JEUqIpFX
	 e+WSncIzH2wNEbFfStUGjIVHBlIWGy8IvPoV5PfzeWBbYsKJly0FnqjMFRMbzyaWwzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
	b=lWJWr6Ub0aqDD9+9HIgp9GN15yA7lBMyRVJFjnx3olQ43Xrna/3FQiPGnDnWbcrQ0rL7
	 k9OIZEsXZYl5H7HFfBcYGyjekewyoF6B5urgOiGVcx2j3yCcNlDyQ/O95a01/iSDTVywR
	 GnnL1b8otjbWOCh09+/G0TUypAeRaqWpvTWriftTYzozjhhbuS7PfqvK5Jn0IvtjbBLzv
	 DBBpTEhl/1GawpqjKHBStWqepjoQRrsJOoQwAVRm1J2WnSP7nYMW49YnLzzMEzsfifCyG
	 5aBqdpa38cW/dDsyBXQ7+lUc1M31KtQ0Zr3Xd52UMfmvtwZEP7qVay/pZ5CaAQz5hMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ETEWtetK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E03606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ETEWtetK
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a707f37eso4467786d6.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565341; cv=none;
        d=google.com; s=arc-20260327;
        b=mhSmEn9RdRCHbLiabbS/bJ7PMDpG7V9USnPsiAjk6K1MxtztAbVQqyMguK58NOptfq
         0ODko6ePNiJMc9d3Fi5Fwl8eUM30NlUYYIkDJ+hGnI3fdqXm8qhAZNKDPt0f5SyZOxWx
         IVXFsMjQ4kpqQYyOGWu4D8q1oQVhXZ5opHC7sXHspKSThTIjLdjoXVrY9lfncRe8IVxG
         JuT8JwKdCSDYqxRqISXNCprwB4XlCM/3lJ5wFfn/3CqNEwHTnTDVSYmZS6UDVppGbSVP
         YPZ6XTDF0TfxBsmZOzPc5/kw4JogmGljPqVaAZLr96SARVzyOUuAjXiDaLVfGsXVFREy
         xrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=HoIMSDDTHJiouIuGSdKtmDnQ08YbwiaXlXIV3vlFr17grRNXSkQtfa21gBHlT9EWMl
         onPACNmfgVYElP3N0gqfbAoVCgHaLoCn8QyoACY65PNmYDEWjBtzLQfg15o/cuHdpkZe
         76OeDBTvXdVLk/sWrbPNLI36RwwVyoqF3G7NaQQqcG+33yA/BqY6vNXqdMrS8uyX63XO
         qY357N7Ytj4XsPcqqs2hhz5HNw1bX968JyfaNA11ongUzhmvprdWfBOjVR9XNPjhPtRL
         Lul0KMNTM9/5hXg7JgJ/m6/nBHFDnOPByzfs1bIDDhwp+mwHnMFervLlbh6r0YNR6e5G
         zODw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565341; x=1793170141; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        b=ETEWtetKr3AYjLdEgPhXtkaTHZDie0stihQlRK1pFxII+69mLcQJAYDjJUYI+pKwjk
         0OOiJGiB0xwP63tfoHxzEIu6SAjuzqybILnpkKlb/Q1X8fVCoD08u778F57JeSqEumzW
         k3CBIlBkz5GvFxV4iGqbosArxG62tmSCima8czu+Tduqz6kshvCtb2joyjPGKs3qUZvW
         12FiSP6BAtQ5rFi1rGD6yBdbwaY3pAxglTg/3oQY57ddg4dMfSuJu/MQGC7ws/iMMmM4
         0nUS3Ogevhgo9WQnU3VikaaHTE2uHD6pEcQ8t0+0S8hBBzXe/nTGnnqAbv5uEkhGtkC5
         xQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565341; x=1793170141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK3e2tyVq27TXWwE9eszxrTGo+m2kUFzEGdefYcqe8=;
        b=YBZB7RjTmnGTXtanUS4JJ7UbfX1Ouw/6wLZOXOcdQ7vm7zZoGKmCUyzWxZzo9lntYJ
         UFhIWDiIGx6dl7vtoXM6tZSR3EOF6dzveQpR+2QzyCXSUsgYgVrzjo9UTUX5Ib8TFLIo
         hrmHdBHs1QXx9XcEq/rRT5F/BSmthFVB8I4MwHPNj/Hd2z5F3Y7vCh/Ve0Et37EehWMY
         le5xR+0qOzhVLA9rHImUgjYfnZWjIo4D7ucDZ5pYtT6jPwqc+jOfYdbtH1xO+iyylSw0
         D+PTiieF9y6/r7o5cREZ8Md06GFqTWuC555eNudIwjM0MPLaAmJ/22oY96t5R/7/rB1K
         A21w==
X-Gm-Message-State: AFq9FYIQtyr73fR8JSTOLNWt6tSTfNMSn+a2FJO0TnDykTOPOSBDMtdm
	doZ6qystOwfAcnw46Pfl59mS+4vrz2bgvf7IzC7O/ko/MZR5DH1x/NNIhTIcU6CrW9E/cGoNYIs
	P+kgC3KPBA+/JPUG2LqdMFIbyRhnDUgxLIeAz
X-Gm-Gg: AYBFou2/lRkRCiyhTGYuPBOZpOK9fbA4pI33gFpBJ2MxXBvoB4jwT5JUxVeVCHPGJVQ
	3FNfxnygLtuobfjssnKKd+0SKsCnRCcK9orib6fnI65r2t7OwPS7h68qfsInCSOwD6/4vsYLte0
	qzl8/bOSsvfpOqdsHVaKrkYYpMAaHKiWfkm9b/ac+s8LI3Ug3hoLc+fANbQu4kP9LOBaKNJbLj3
	s1fPjK6Hv9DRMDUhLJVVoBmXy3Vg0mhLCPyPgM1nZROiokLgcmqNNNNvl8vWJCDYnW9VHnG+aZr
	4pht8ohlUXApSi7bD57btSus/lAQJ+cRgCyhd4t+HIjJEqQNdrDQ6bxWwcysbop8JBgM4+dvLLs
	JElu/KLwwGF2Pahvc4C+GrvCOomCdCtRSRWF47Q==
X-Received: by 2002:ad4:5de5:0:b0:91b:de10:e9bf with SMTP id
 6a1803df08f44-91c12f5e5a9mr18172186d6.50.1792565340653; Tue, 20 Oct 2026
 23:49:00 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-8-a0282524688@gmail.com> <sashiko-outbox-169141@kernel.org>
In-Reply-To: <sashiko-outbox-169141@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:48:49 +0800
X-Gm-Features: AclHuK_yxdgb81kYvm61_aMQhj1JDKLAcvGN0abH9YT9LUNTn1rxKPwEVfB_tlU
Message-ID: <CAOoeyxUB-0YVV-9QhwfvixWYKvQY8ijZvQG+Vr1-XKXG1=Tesw@mail.gmail.com>
Subject: Re: [PATCH v9 07/12] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: nct6694 driver name hardcodes implementation details
> --
> [ ... ]
> > @@ -441,20 +445,20 @@ static void nct6694_usb_disconnect(struct usb_int=
erface *iface)
> >       usb_free_urb(usb_data->int_urb);
> >  }
> >
> > -static const struct usb_device_id nct6694_ids[] =3D {
> > +static const struct usb_device_id nct6694_usb_ids[] =3D {
> >       { USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUC=
T_ID, 0xFF, 0x00, 0x00) },
> >       { }
> >  };
> > -MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
> >
> >  static struct usb_driver nct6694_usb_driver =3D {
> > -     .name           =3D "nct6694",
> > -     .id_table       =3D nct6694_ids,
> > +     .name           =3D "nct6694-usb",
>
> [Severity: Low]
> Does this violate the MFD subsystem naming conventions by hard-coding
> the implementation detail ("usb") into the driver name? The subsystem
> guidelines specify that we should avoid including implementation details
> or the driver's own filename in names, as it creates rigid and non-reusab=
le
> drivers.
>

The suffix names the transport, not an implementation detail. It
distinguishes this driver from the new nct6694-hif driver, so no
change is planned.
